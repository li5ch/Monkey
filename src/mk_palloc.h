/*
 * @Description: memory poll              
 * @Author: t-wuli
 * @Date: 2019-07-14 23:03:09
 * @LastEditTime: 2019-07-15 02:48:49
 * @LastEditors: Please set LastEditors
 */

#ifndef _MK_PALLOC_H_INCLUDED_
#define _MK_PALLOC_H_INCLUDED_

#define MK_MAX_ALLOC_FROM_POOL (4096 - 1)

#define MK_DEFAULT_POOL_SIZE (16 * 1024)

#define MK_POOL_ALIGNMENT 16
#define MK_MIN_POOL_SIZE                                        \
    mk_align((sizeof(mk_pool_t) + 2 * sizeof(mk_pool_large_t)), \
             mk_POOL_ALIGNMENT)
#define mk_align_ptr(p, a) \
    (char *)(((uintptr_t)(p) + ((uintptr_t)a - 1)) & ~((uintptr_t)a - 1))
typedef void (*mk_pool_cleanup_pt)(void *data);

typedef struct mk_pool_cleanup_s mk_pool_cleanup_t;

struct mk_pool_cleanup_s
{
    mk_pool_cleanup_pt handler;
    void *data;
    mk_pool_cleanup_t *next;
};

typedef struct mk_pool_s mk_pool_t;
typedef struct mk_pool_large_s mk_pool_large_t;

struct ngx_pool_large_s
{
    mk_pool_large_t *next;
    void *alloc;
};

typedef struct
{
    char *last;
    char *end;
    mk_pool_t *next;
    int failed;
} mk_pool_data_t;

struct mk_pool_s
{
    mk_pool_data_t d;
    int max;
    mk_pool_t *current;
    mk_pool_large_t *large;
    mk_pool_cleanup_t *cleanup;
};

typedef struct
{
    int fd;
    char *name;
} mk_pool_cleanup_file_t;

mk_pool_t *mk_create_pool(int size);
void mk_destroy_pool(mk_pool_t *pool);
void mk_reset_pool(mk_pool_t *pool);

void *mk_palloc(mk_pool_t *pool, int size);
void *mk_pcalloc(mk_pool_t *pool, int size);
int mk_pfree(mk_pool_t *pool, void *p);

mk_pool_cleanup_t *mk_pool_cleanup_add(mk_pool_t *p, int size);
void mk_pool_run_cleanup_file(mk_pool_t *p, int fd);
void mk_pool_cleanup_file(void *data);
void mk_pool_delete_file(void *data);

#endif /* _MK_PALLOC_H_INCLUDED_ */
