#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include <stdint.h>

extern "C"
{
    int8_t* __quantum__rt__tuple_create(int64_t n);
    void    __quantum__rt__tuple_update_reference_count(int8_t* tuple, int32_t n);
    int8_t* __quantum__rt__array_create_1d(int32_t size, int64_t n);
    int8_t* __quantum__rt__array_get_element_ptr_1d(int8_t* ptr, int64_t n);
    void    __quantum__rt__qubit_release_array(int8_t* ptr);
    void    __quantum__rt__array_update_alias_count(int8_t* ptr, int32_t n);
    void    __quantum__rt__array_update_reference_count(int8_t* ptr, int32_t n);
    int8_t* __quantum__rt__array_copy(int8_t* ptr, bool force);
    int64_t __quantum__rt__array_get_size_1d(int8_t* ptr);

    // Helper functions to test
    int64_t __quantum__dev__array_get_element_size(int8_t* ptr);
    int64_t __quantum__dev__array_get_alias_count(int8_t* ptr);
    int64_t __quantum__dev__array_get_ref_count(int8_t* ptr);
}
