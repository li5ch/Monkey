#include "monkey.h"

static inline void *mk_palloc_small(mk_pool_t *pool, int size);
static void *mk_palloc_block(mk_pool_t *pool, int size);
static void *mk_palloc_large(mk_pool_t *pool, int size);

/**
 * @brief pool内存布局data
 * 
 * @param size 
 * @return mk_pool_t* 
 */
mk_pool_t *
mk_create_pool(int size)
{
    mk_pool_t *p;

    p = malloc(size);
    if (p == NULL)
    {
        return NULL;
    }
    //注意可分配内存必须从pool数据成员之后开始
    p->d.last = (char *)p + sizeof(mk_pool_t);
    p->d.end = (char *)p + size;
    p->d.next = NULL;
    p->d.failed = 0;

    size = size - sizeof(mk_pool_t);
    p->max = (size < MK_MAX_ALLOC_FROM_POOL) ? size : MK_MAX_ALLOC_FROM_POOL;

    p->current = p;
    p->large = NULL;
    p->cleanup = NULL;

    return p;
}

void mk_destroy_pool(mk_pool_t *pool)
{
    mk_pool_t *p, *n;
    mk_pool_large_t *l;
    mk_pool_cleanup_t *c;

    for (c = pool->cleanup; c; c = c->next)
    {
        if (c->handler)
        {
            c->handler(c->data);
        }
    }

    for (l = pool->large; l; l = l->next)
    {
        if (l->alloc)
        {
            free(l->alloc);
        }
    }

    for (p = pool, n = pool->d.next; /* void */; p = n, n = n->d.next)
    {
        free(p);

        if (n == NULL)
        {
            break;
        }
    }
}

void mk_reset_pool(mk_pool_t *pool)
{
    mk_pool_t *p;
    mk_pool_large_t *l;

    for (l = pool->large; l; l = l->next)
    {
        if (l->alloc)
        {
            mk_free(l->alloc);
        }
    }

    for (p = pool; p; p = p->d.next)
    {
        p->d.last = (char *)p + sizeof(mk_pool_t);
        p->d.failed = 0;
    }

    pool->current = pool;
    pool->large = NULL;
}

void *
mk_palloc(mk_pool_t *pool, int size)
{
    if (size <= pool->max)
    {
        return mk_palloc_small(pool, size);
    }
    return mk_palloc_large(pool, size);
}

static inline void *
mk_palloc_small(mk_pool_t *pool, int size)
{
    char *m;
    mk_pool_t *p;

    p = pool->current;

    do
    {
        m = p->d.last;

        if ((int)(p->d.end - m) >= size)
        {
            p->d.last = m + size;

            return m;
        }

        p = p->d.next;

    } while (p);

    return mk_palloc_block(pool, size);
}

static void *
mk_palloc_block(mk_pool_t *pool, int size)
{
    char *m;
    int psize;
    mk_pool_t *p, *new;

    psize = (int)(pool->d.end - (char *)pool);

    m = malloc(psize);
    if (m == NULL)
    {
        return NULL;
    }

    new = (mk_pool_t *)m;

    new->d.end = m + psize;
    new->d.next = NULL;
    new->d.failed = 0;

    m += sizeof(mk_pool_data_t);
    new->d.last = m + size;
    //这里new之前的pool都是failed必须+1直到failed4次后移动current
    for (p = pool->current; p->d.next; p = p->d.next)
    {
        if (p->d.failed++ > 4)
        {
            pool->current = p->d.next;
        }
    }

    p->d.next = new;

    return m;
}

static void *
mk_palloc_large(mk_pool_t *pool, int size)
{
    void *p;
    int n;
    mk_pool_large_t *large;

    p = malloc(size);
    if (p == NULL)
    {
        return NULL;
    }

    n = 0;

    for (large = pool->large; large; large = large->next)
    {
        if (large->alloc == NULL)
        {
            large->alloc = p;
            return p;
        }
        //为了防止large过大遍历次数最多4次
        if (n++ > 3)
        {
            break;
        }
    }

    large = mk_palloc_small(pool, sizeof(mk_pool_large_t));
    if (large == NULL)
    {
        mk_free(p);
        return NULL;
    }

    large->alloc = p;
    large->next = pool->large;
    pool->large = large;

    return p;
}

int mk_pfree(mk_pool_t *pool, void *p)
{
    mk_pool_large_t *l;

    for (l = pool->large; l; l = l->next)
    {
        if (p == l->alloc)
        {

            free(l->alloc);
            l->alloc = NULL;

            return MK_OK;
        }
    }

    return MK_DECLINED;
}

void *
mk_pcalloc(mk_pool_t *pool, int size)
{
    void *p;

    p = mk_palloc(pool, size);
    if (p)
    {
        memset(p, 0, size);
    }

    return p;
}

mk_pool_cleanup_t *
mk_pool_cleanup_add(mk_pool_t *p, int size)
{
    mk_pool_cleanup_t *c;

    c = mk_palloc(p, sizeof(mk_pool_cleanup_t));
    if (c == NULL)
    {
        return NULL;
    }

    if (size)
    {
        c->data = mk_palloc(p, size);
        if (c->data == NULL)
        {
            return NULL;
        }
    }
    else
    {
        c->data = NULL;
    }

    c->handler = NULL;
    c->next = p->cleanup;

    p->cleanup = c;

    return c;
}

void mk_pool_run_cleanup_file(mk_pool_t *p, int fd)
{
    mk_pool_cleanup_t *c;
    mk_pool_cleanup_file_t *cf;

    for (c = p->cleanup; c; c = c->next)
    {
        if (c->handler == mk_pool_cleanup_file)
        {

            cf = c->data;

            if (cf->fd == fd)
            {
                c->handler(cf);
                c->handler = NULL;
                return;
            }
        }
    }
}

void mk_pool_cleanup_file(void *data)
{
    mk_pool_cleanup_file_t *c = data;
}

void mk_pool_delete_file(void *data)
{
    mk_pool_cleanup_file_t *c = data;

    // if (mk_delete_file(c->name) == mk_FILE_ERROR)
    // {
    //     err = mk_errno;

    //     if (err != mk_ENOENT)
    //     {
    //         mk_log_error(mk_LOG_CRIT, c->log, err,
    //                      mk_delete_file_n " \"%s\" failed", c->name);
    //     }
    // }

    // if (mk_close_file(c->fd) == mk_FILE_ERROR)
    // {
    //     mk_log_error(mk_LOG_ALERT, c->log, mk_errno,
    //                  mk_close_file_n " \"%s\" failed", c->name);
    // }
}
