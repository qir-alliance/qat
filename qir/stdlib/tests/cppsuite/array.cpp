#include "qir-stdlib.h"

#include <cassert>
#include <iomanip>
#include <iostream>

template <typename T>
class ArrayTest
{
public:
  ArrayTest(int64_t const &size)
    : container_{__quantum__rt__array_create_1d(sizeof(T), size)}
  {}

  ArrayTest(ArrayTest const &other)
    : container_{__quantum__rt__array_copy(other.container_, false)}
  {}

  ~ArrayTest()
  {
    __quantum__rt__array_update_reference_count(container_, -1);
  }

  T &operator[](int64_t const &n)
  {
    return *reinterpret_cast<T *>(__quantum__rt__array_get_element_ptr_1d(container_, n));
  }

  int64_t size()
  {
    return __quantum__rt__array_get_size_1d(container_);
  }

  void increaseAlias()
  {
    __quantum__rt__array_update_alias_count(container_, 1);
  }

  void decreaseAlias()
  {
    __quantum__rt__array_update_alias_count(container_, -1);
  }

  bool operator==(ArrayTest const &other) const
  {
    return container_ == other.container_;
  }

  bool operator!=(ArrayTest const &other) const
  {
    return container_ != other.container_;
  }

  int64_t refCount()
  {
    return __quantum__dev__array_get_ref_count(container_);
  }

  int64_t aliasCount()
  {
    return __quantum__dev__array_get_alias_count(container_);
  }

  int64_t elementSize()
  {
    return __quantum__dev__array_get_element_size(container_);
  }

private:
  int8_t *container_;
};

template <typename T>
void intTest(int64_t count)
{
  ArrayTest<T> arr(count);
  assert(arr.size() == count);
  assert(arr.elementSize() == sizeof(T));
  for (int64_t i = 0; i < arr.size(); ++i)
  {
    arr[i] = static_cast<T>(123 + i);
  }

  for (int64_t i = 0; i < arr.size(); ++i)
  {
    assert(arr[i] == static_cast<T>(123 + i));
  }
}

template <typename T>
void testLazyCopy(int64_t count)
{
  ArrayTest<T> arr(count);
  assert(arr.size() == count);
  assert(arr.elementSize() == sizeof(T));
  assert(arr.refCount() == 1);
  assert(arr.aliasCount() == 0);

  for (int64_t i = 0; i < arr.size(); ++i)
  {
    arr[i] = static_cast<T>(123 + i);
  }

  {
    ArrayTest<T> copy(arr);

    assert(arr.refCount() == 2);
    assert(arr.aliasCount() == 0);

    assert(copy.refCount() == 2);
    assert(copy.aliasCount() == 0);
    assert(copy == arr);
    for (int64_t i = 0; i < arr.size(); ++i)
    {
      assert(copy[i] == static_cast<T>(123 + i));
    }
  }

  assert(arr.refCount() == 1);
  assert(arr.aliasCount() == 0);

  {
    arr.increaseAlias();
    ArrayTest<T> copy(arr);
    assert(arr.refCount() == 1);
    assert(arr.aliasCount() == 1);

    assert(copy.refCount() == 1);
    assert(copy.aliasCount() == 0);

    assert(copy != arr);
    for (int64_t i = 0; i < arr.size(); ++i)
    {
      assert(copy[i] == static_cast<T>(123 + i));
    }
    arr.decreaseAlias();
  }

  assert(arr.refCount() == 1);
  assert(arr.aliasCount() == 0);
}

template <typename T>
void testRefCountRecurse(ArrayTest<T> &orig, int64_t depth)
{
  if (depth > 20)
  {
    return;
  }
  assert(orig.refCount() == depth);
  assert(orig.aliasCount() == 0);

  {
    ArrayTest<T> arr(orig);
    assert(orig.refCount() == depth + 1);
    assert(orig.aliasCount() == 0);
    assert(arr.refCount() == depth + 1);
    assert(arr.aliasCount() == 0);
    testRefCountRecurse(orig, depth + 1);
  }
  assert(orig.refCount() == depth);
  assert(orig.aliasCount() == 0);
}

template <typename T>
void testRefCount(int64_t count)
{
  ArrayTest<T> arr(count);
  for (int64_t i = 0; i < arr.size(); ++i)
  {
    arr[i] = static_cast<T>(123 + i);
  }
  assert(arr.refCount() == 1);
  assert(arr.aliasCount() == 0);
}

void testPrimitiveReadWrite()
{
  intTest<int8_t>(10);
  intTest<int16_t>(10);
  intTest<int32_t>(10);
  intTest<int64_t>(10);

  intTest<uint8_t>(100000);
  intTest<uint16_t>(10000);
  intTest<uint32_t>(10000);
  intTest<uint64_t>(10000);
}

void testLazyCopying()
{
  testLazyCopy<int8_t>(10);
  testLazyCopy<int16_t>(10);
  testLazyCopy<int32_t>(10);
  testLazyCopy<int64_t>(10);

  testLazyCopy<uint8_t>(100000);
  testLazyCopy<uint16_t>(10000);
  testLazyCopy<uint32_t>(10000);
  testLazyCopy<uint64_t>(10000);
}

void testReferences()
{
  testRefCount<int8_t>(10);
  testRefCount<int16_t>(10);
  testRefCount<int32_t>(10);
  testRefCount<int64_t>(10);

  testRefCount<uint8_t>(100000);
  testRefCount<uint16_t>(10000);
  testRefCount<uint32_t>(10000);
  testRefCount<uint64_t>(10000);
}

int main()
{
  testPrimitiveReadWrite();
  testLazyCopying();
  testReferences();

  return 0;
}