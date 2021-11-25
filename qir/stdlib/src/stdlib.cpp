#include <cstdint>
#include <cstring>
#include <utility>

class Array
{
public:
  Array(int64_t size_, int64_t count_) noexcept
    : size{std::move(size_)}
    , count{std::move(count_)}
  {
    data = new int8_t[size * count];
  }

  Array(Array *ref) noexcept
    : size{ref->size}
    , count{ref->count}
  {
    data = new int8_t[size * count];
    memcpy(data, ref->data, size * count);
  }

  ~Array() noexcept
  {
    delete[] data;
  }

  int64_t size;
  int64_t count;
  int8_t *data;
  int64_t alias_count{0};
  int64_t ref_count{1};
};

extern "C"
{
  int8_t *__quantum__rt__tuple_create(int64_t n)
  {
    auto  ret = new int8_t[n + 3 * sizeof(int64_t)];
    auto &s   = *reinterpret_cast<int64_t *>(ret);
    auto &r   = *reinterpret_cast<int64_t *>(ret + sizeof(int64_t));
    auto &a   = *reinterpret_cast<int64_t *>(ret + 2 * sizeof(int64_t));
    s         = n;
    r         = 1;
    a         = 0;
    return ret + 3 * sizeof(int64_t);
  }

  void __quantum__rt__tuple_update_reference_count(int8_t *tuple, int32_t n)
  {
    auto  ptr = tuple - 3 * sizeof(int64_t);
    auto &r   = *reinterpret_cast<int64_t *>(ptr + sizeof(int64_t));
    r += static_cast<int64_t>(n);
    if (r <= 0)
    {
      delete ptr;
    }
  }

  int8_t *__quantum__rt__array_create_1d(int32_t size, int64_t n)
  {
    Array *data = new Array(size, n);
    return reinterpret_cast<int8_t *>(data);
  }

  int64_t __quantum__rt__array_get_size_1d(int8_t *ptr)
  {
    auto array = reinterpret_cast<Array *>(ptr);
    return array->count;
  }

  int8_t *__quantum__rt__array_get_element_ptr_1d(int8_t *ptr, int64_t n)
  {
    auto array = reinterpret_cast<Array *>(ptr);
    return array->data + n * array->size;
  }

  void __quantum__rt__qubit_release_array(int8_t *ptr)
  {
    auto array = reinterpret_cast<Array *>(ptr);
    delete array;
  }

  void __quantum__rt__array_update_alias_count(int8_t *ptr, int32_t n)
  {
    auto arr = reinterpret_cast<Array *>(ptr);
    arr->alias_count += n;
  }

  void __quantum__rt__array_update_reference_count(int8_t *ptr, int32_t n)
  {
    auto arr = reinterpret_cast<Array *>(ptr);
    arr->ref_count += n;

    if (arr->ref_count <= 0)
    {
      delete arr;
    }
  }

  int64_t __quantum__dev__array_get_element_size(int8_t *ptr)
  {
    auto arr = reinterpret_cast<Array *>(ptr);
    return arr->size;
  }

  int64_t __quantum__dev__array_get_alias_count(int8_t *ptr)
  {
    auto arr = reinterpret_cast<Array *>(ptr);
    return arr->alias_count;
  }

  int64_t __quantum__dev__array_get_ref_count(int8_t *ptr)
  {
    auto arr = reinterpret_cast<Array *>(ptr);
    return arr->ref_count;
  }

  int8_t *__quantum__rt__array_copy(int8_t *ptr, bool force)
  {
    auto arr = reinterpret_cast<Array *>(ptr);
    if (arr == nullptr)
    {
      return nullptr;
    }

    if (force || arr->alias_count > 0)
    {
      Array *data = new Array(arr);
      return reinterpret_cast<int8_t *>(data);
    }

    arr->ref_count += 1;

    return ptr;
  }
}