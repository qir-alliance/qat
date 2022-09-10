#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/external/yaml.hpp"

#include <type_traits>

namespace microsoft::quantum
{

template <typename C> struct HasQatSerializers
{
  private:
    template <typename T>
    static constexpr auto checkToYaml(T*) ->
        typename std::is_same<decltype(std::declval<T>().toYaml(std::declval<YAML::Node&>())), void>::type;

    template <typename> static constexpr std::false_type checkToYaml(...);

    template <typename T>
    static constexpr auto checkFromYaml(T*) ->
        typename std::is_same<decltype(std::declval<T>().fromYaml(std::declval<YAML::Node>())), void>::type;

    template <typename> static constexpr std::false_type checkFromYaml(...);

    template <typename T>
    static constexpr auto checkToString(T*) ->
        typename std::is_same<decltype(std::declval<T>().toString(std::declval<std::string&>())), void>::type;

    template <typename> static constexpr std::false_type checkToString(...);

    template <typename T>
    static constexpr auto checkFromString(T*) ->
        typename std::is_same<decltype(std::declval<T>().fromString(std::declval<std::string>())), void>::type;

    template <typename> static constexpr std::false_type checkFromString(...);

    typedef decltype(checkToYaml<C>(nullptr))   CheckToYaml;
    typedef decltype(checkFromYaml<C>(nullptr)) CheckFromYaml;

    typedef decltype(checkToString<C>(nullptr))   CheckToString;
    typedef decltype(checkFromString<C>(nullptr)) CheckFromString;

  public:
    static constexpr bool VALUE =
        CheckToYaml::value && CheckFromYaml::value && CheckToString::value && CheckFromString::value;
};

static_assert(!HasQatSerializers<int32_t>::VALUE, "Expected int32 to be not serializable.");
static_assert(!HasQatSerializers<uint64_t>::VALUE, "Expected uint64 to be not serializable.");
static_assert(!HasQatSerializers<bool>::VALUE, "Expected bool to be not serializable.");
static_assert(!HasQatSerializers<String>::VALUE, "Expected string to be not serializable.");

} // namespace microsoft::quantum
