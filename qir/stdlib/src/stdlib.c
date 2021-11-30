// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define QUANTUM_ARRAY_RESERVED (4 * sizeof(int64_t))
#define QUANTUM_ARRAY_ALIAS_POS (3 * sizeof(int64_t))
#define QUANTUM_ARRAY_REF_POS (2 * sizeof(int64_t))
#define QUANTUM_ARRAY_COUNT_POS (sizeof(int64_t))
#define QUANTUM_ARRAY_SIZE_POS 0

#define QUANTUM_TUPLE_RESERVED (3 * sizeof(int64_t))
#define QUANTUM_TUPLE_REF_POS (sizeof(int64_t))
#define QUANTUM_TUPLE_ALIAS_POS (2 * sizeof(int64_t))

// Tuple RT functions
//

/// @brief creates a a tuple of a given size
///
/// @param n is the size of the tuple
int8_t* __quantum__rt__tuple_create(int64_t n)
{
    int8_t*  ret         = (int8_t*)malloc(n + 3 * sizeof(int64_t));
    int64_t* size        = (int64_t*)(ret);
    int64_t* ref_count   = (int64_t*)(ret + sizeof(int64_t));
    int64_t* alias_count = (int64_t*)(ret + 2 * sizeof(int64_t));

    // Setting default values
    *size        = n;
    *ref_count   = 1;
    *alias_count = 0;

    // Returning the pointer to the tuple data start
    return ret + QUANTUM_TUPLE_RESERVED;
}

/// @brief updates the reference count
///
/// @param tuple is a pointer to the tuple
/// @param n is the increase or decrease in
void __quantum__rt__tuple_update_reference_count(int8_t* tuple, int32_t n)
{
    int8_t*  ptr       = tuple - QUANTUM_TUPLE_RESERVED;
    int64_t* ref_count = (int64_t*)(ptr + QUANTUM_TUPLE_REF_POS);
    *ref_count += (int64_t)(n);

    // Here we check if the number n is negative because LLVM will optimise
    // this block away automatically if it is positive. This prevents "complicated"
    // logic to enter the IR and makes easier for LLVM to optimise the all expressions
    // later on.
    if (n < 0)
    {
        // In case the ref count goes below zero ...
        if (*ref_count <= 0)
        {
            // ... the memory is freed.
            free(ptr);
        }
    }
}

/// @brief updates the alias count.
///
/// @param tuple is a pointer to the tuple
/// @param n is the increase or decrease in the alias count
void __quantum__rt__tuple_update_alias_count(int8_t* tuple, int32_t n)
{
    int8_t*  ptr = tuple - 3 * sizeof(int64_t);
    int64_t* a   = (int64_t*)(ptr + 3 * sizeof(int64_t));
    *a += (int64_t)(n);
}

// Array RT functions
//

/// @brief Creates a 1D array with N elements of a given size.
///
/// @param size is the size of the element.
/// @param n is the number of elements in the array.
int8_t* __quantum__rt__array_create_1d(int32_t size, int64_t n)
{
    int8_t*  ret          = (int8_t*)malloc((n * size) + QUANTUM_ARRAY_RESERVED);
    int64_t* element_size = (int64_t*)(ret + QUANTUM_ARRAY_SIZE_POS);
    int64_t* count        = (int64_t*)(ret + QUANTUM_ARRAY_COUNT_POS);
    int64_t* ref_count    = (int64_t*)(ret + QUANTUM_ARRAY_REF_POS);
    int64_t* alias_count  = (int64_t*)(ret + QUANTUM_ARRAY_ALIAS_POS);

    // Setting initial values
    *element_size = (int64_t)size;
    *count        = n;
    *ref_count    = 1;
    *alias_count  = 0;

    // Returning the array
    return ret;
}

/// @brief gets the number of elements in the array
///
/// @param array is a pointer to the array.
int64_t __quantum__rt__array_get_size_1d(int8_t* array)
{
    int64_t* count = (int64_t*)(array + QUANTUM_ARRAY_COUNT_POS);
    return *count;
}

/// @brief gets the n'th element of an array
///
/// @param array is a pointer to the array
/// @param n is the element
int8_t* __quantum__rt__array_get_element_ptr_1d(int8_t* array, int64_t n)
{
    int64_t* element_size = (int64_t*)(array);
    return (array + (*element_size) * n + QUANTUM_ARRAY_RESERVED);
}

/// @brief updates the alias count.
///
/// @param array is a pointer to the array
/// @param n is the increase or decrease in the alias count
void __quantum__rt__array_update_alias_count(int8_t* arr, int32_t n)
{
    int64_t* alias_count = (int64_t*)((int8_t*)arr + QUANTUM_ARRAY_ALIAS_POS);
    *alias_count += (int64_t)(n);
}

/// @brief updates the reference count.
///
/// @param array is a pointer to the array
/// @param n is the increase or decrease in the reference count
void __quantum__rt__array_update_reference_count(int8_t* arr, int32_t n)
{
    int64_t* ref_count = (int64_t*)((int8_t*)(arr) + QUANTUM_ARRAY_REF_POS);
    *ref_count += (int64_t)(n);

    // Here we check if the number n is negative because LLVM will optimise
    // this block away automatically if it is positive. This prevents "complicated"
    // logic to enter the IR and makes easier for LLVM to optimise the all expressions
    // later on.
    if (n < 0)
    {
        // In case the ref count goes below zero ...
        if (*ref_count <= 0)
        {
            // ... the memory is freed.
            free(arr);
        }
    }
}

/// @brief concatenates two arrays
///
/// @param array1 is the first array
/// @param array2 is the second array
int8_t* __quantum__rt__array_concatenate(int8_t* array1, int8_t* array2)
{
    int64_t element_size = *(int64_t*)((int8_t*)(array1) + QUANTUM_ARRAY_SIZE_POS);

    int64_t count1 = *(int64_t*)((int8_t*)(array1) + QUANTUM_ARRAY_COUNT_POS);
    int64_t count2 = *(int64_t*)((int8_t*)(array2) + QUANTUM_ARRAY_COUNT_POS);

    // Creating new array
    int8_t* ret = (int8_t*)__quantum__rt__array_create_1d(element_size, count1 + count2);

    // Offsetting arrays to the data section
    int8_t* off1       = (int8_t*)array1 + QUANTUM_ARRAY_RESERVED;
    int8_t* off2       = (int8_t*)array2 + QUANTUM_ARRAY_RESERVED;
    int8_t* ret_offset = ret + QUANTUM_ARRAY_RESERVED;

    // Copying data
    memcpy(ret_offset, off1, count1 * element_size);
    memcpy(ret_offset + count1 * element_size, off2, count2 * element_size);

    return ret;
}

/// @brief performs a lazy copy of an array
///
/// @param array is the array
/// @param force whether or not to force the copy
int8_t* __quantum__rt__array_copy(int8_t* array, bool force)
{
    // Ignoring null arrays. This should in principle not occur for
    // a correctly constructed QIR but is added as a safe-guard.
    if (array == NULL)
    {
        return NULL;
    }

    // Getting alias count
    int64_t* alias_count = (int64_t*)(array + QUANTUM_ARRAY_ALIAS_POS);

    if (force || *alias_count > 0)
    {
        int64_t element_size = *(int64_t*)(array + QUANTUM_ARRAY_SIZE_POS);
        int64_t count        = *(int64_t*)(array + QUANTUM_ARRAY_COUNT_POS);

        int8_t* ret = (int8_t*)__quantum__rt__array_create_1d(element_size, count);
        memcpy(ret + QUANTUM_ARRAY_RESERVED, array + QUANTUM_ARRAY_RESERVED, element_size * count);
        return ret;
    }

    // Increasing the reference count and returning the same array
    int64_t* ref_count = (int64_t*)(array + QUANTUM_ARRAY_REF_POS);
    *ref_count += (int64_t)(1);

    return array;
}

// Helper functions for testing
//
int64_t __quantum__dev__array_get_element_size(int8_t* ptr)
{
    return *(int64_t*)((int8_t*)(ptr) + QUANTUM_ARRAY_SIZE_POS);
}

int64_t __quantum__dev__array_get_alias_count(int8_t* ptr)
{
    int64_t* alias_count = (int64_t*)((int8_t*)(ptr) + QUANTUM_ARRAY_ALIAS_POS);
    return *alias_count;
}

int64_t __quantum__dev__array_get_ref_count(int8_t* ptr)
{
    int64_t* ref_count = (int64_t*)((int8_t*)(ptr) + QUANTUM_ARRAY_REF_POS);
    return *ref_count;
}
