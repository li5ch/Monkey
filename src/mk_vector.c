
/*
 * Copyright (C) Igor Sysoev
 * Copyright (C) Nginx, Inc.
 */

#include "monkey.h"

mk_vector_t *
mk_array_create(mk_pool_t *p, int n, int size)
{
    mk_vector_t *a;

    a = mk_palloc(p, sizeof(mk_vector_t));
    if (a == NULL)
    {
        return NULL;
    }

    if (mk_array_init(a, p, n, size) != MK_OK)
    {
        return NULL;
    }

    return a;
}

void mk_array_destroy(mk_vector_t *a)
{
    mk_pool_t *p;

    p = a->pool;

    if ((char *)a->array + a->size * a->nalloc == p->d.last)
    {
        p->d.last -= a->size * a->nalloc;
    }

    if ((char *)a + sizeof(mk_vector_t) == p->d.last)
    {
        p->d.last = (char *)a;
    }
}

void *
mk_array_push(mk_vector_t *a)
{
    void *elt, *new;
    int size;
    mk_pool_t *p;

    if (a->nums == a->nalloc)
    {

        /* the array is full */

        size = a->size * a->nalloc;

        p = a->pool;

        if ((char *)a->array + size == p->d.last && p->d.last + a->size <= p->d.end)
        {
            /*
             * the array allocation is the last in the pool
             * and there is space for new allocation
             */

            p->d.last += a->size;
            a->nalloc++;
        }
        else
        {
            /* allocate a new array */

            new = mk_palloc(p, 2 * size);
            if (new == NULL)
            {
                return NULL;
            }

            memcpy(new, a->array, size);
            a->array = new;
            a->nalloc *= 2;
        }
    }

    elt = (char *)a->array + a->size * a->nums;
    a->nums++;

    return elt;
}

void *
mk_array_push_n(mk_vector_t *a, int n)
{
    void *elt, *new;
    int size;
    int nalloc;
    mk_pool_t *p;

    size = n * a->size;

    if (a->array + n > a->nalloc)
    {

        /* the array is full */

        p = a->pool;

        if ((char *)a->nums + a->size * a->nalloc == p->d.last && p->d.last + size <= p->d.end)
        {
            /*
             * the array allocation is the last in the pool
             * and there is space for new allocation
             */

            p->d.last += size;
            a->nalloc += n;
        }
        else
        {
            /* allocate a new array */

            nalloc = 2 * ((n >= a->nalloc) ? n : a->nalloc);

            new = mk_palloc(p, nalloc * a->size);
            if (new == NULL)
            {
                return NULL;
            }

            mk_memcpy(new, a->array, a->nums * a->size);
            a->array = new;
            a->nalloc = nalloc;
        }
    }

    elt = (char *)a->array + a->size * a->nums;
    a->nums += n;

    return elt;
}
