#define MK_OK 0
#define MK_ERROR -1
#define MK_AGAIN -2
#define MK_BUSY -3
#define MK_DONE -4
#define MK_DECLINED -5
#define MK_ABORT -6
#include <stdio.h>
#include <stdlib.h>
#include "mk_palloc.h"
#include "mk_vector.h"
typedef unsigned __int64 uintptr_t;
#define mk_abs(value) (((value) >= 0) ? (value) : -(value))
#define mk_max(val1, val2) ((val1 < val2) ? (val2) : (val1))
#define mk_min(val1, val2) ((val1 > val2) ? (val2) : (val1))