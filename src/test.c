#include "monkey.h"
typedef struct T
{
    int an;
} node;
int main()
{
    mk_pool_t *pool;
    int i;

    printf("--------------------------------\n");
    printf("create a new pool:\n");
    printf("--------------------------------\n");
    pool = mk_create_pool(1000);

    printf("alloc an array from the pool:6\n");
    printf("--------------------------------\n");
    mk_vector_t *a = mk_array_create(pool, 5, sizeof(int));

    for (i = 0; i < 5; i++)
    {
        int *ptr = (int *)mk_array_push(a);
        *ptr = i;
        printf("%d\n", *ptr);
    }
    mk_array_destroy(a);
    mk_destroy_pool(pool);
    return 0;
}