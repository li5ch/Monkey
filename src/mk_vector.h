/*
 * @Description: vector function in monkey
 * @Author: t-wuli
 * @Date: 2019-07-14 16:41:30
 * @LastEditTime: 2019-07-15 02:26:13
 * @LastEditors: Please set LastEditors
 */

#ifndef _MK_VECTOR_H_INCLUDED_
#define _MK_VECTOR_H_INCLUDED_
#include "monkey.h"
typedef struct
{
    void *array;
    int nums;
    int size;
    int nalloc;
    mk_pool_t *pool;
} mk_vector_t;

mk_vector_t *mk_array_create(mk_pool_t *p, int n, int size);
void mk_array_destroy(mk_vector_t *a);
void *mk_array_push(mk_vector_t *a);
void *mk_array_push_n(mk_vector_t *a, int n);

static inline int
mk_array_init(mk_vector_t *vector, mk_pool_t *pool, int n, int size)
{

    vector->array = 0;
    vector->size = size;
    vector->nalloc = n;
    vector->pool = pool;

    vector->array = mk_palloc(pool, n * size);
    if (vector->array == NULL)
    {
        return MK_ERROR;
    }

    return MK_OK;
}

#endif /* _MK_ARRAY_H_INCLUDED_ */
