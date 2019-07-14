#include "monkey.h"
typedef struct T{
    int an;
} node;
int main()
{
    mk_pool_t *pool = mk_create_pool(sizeof(int));
    mk_vector_t *v = mk_array_create(pool, 1, sizeof(int));
    node *a = mk_array_push(v);
    a->an = 1;
    a = mk_array_push(v);
    a->an = 2;
    int *b = v->array;
    int i = 0;
    for (; i < v->nums;i++){
        a = b + i;
        printf("%d", a->an);
    }
    return 0;
}