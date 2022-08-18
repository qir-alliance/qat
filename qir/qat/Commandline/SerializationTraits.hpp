#pragma once
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#include "qir/external/yaml.hpp"

#include <type_traits>

namespace microsoft::quantum
{

template <typename C> struct YamlSerializable
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

    typedef decltype(checkToYaml<C>(0))   check1;
    typedef decltype(checkFromYaml<C>(0)) check2;

    typedef decltype(checkToString<C>(0))   check3;
    typedef decltype(checkFromString<C>(0)) check4;

  public:
    static constexpr bool value = check1::value && check2::value && check3::value && check4::value;
};

} // namespace microsoft::quantum
