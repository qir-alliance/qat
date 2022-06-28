# CMake generated Testfile for 
# Source directory: /Users/tfr/Documents/Projects/qat/qir/qat
# Build directory: /Users/tfr/Documents/Projects/qat/Debug/qir/qat
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(TestToolsUnitTests "TestToolsUnitTests" "--gtest_shuffle" "--gtest_random_seed=1337")
set_tests_properties(TestToolsUnitTests PROPERTIES  _BACKTRACE_TRIPLES "/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;21;add_test;/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;38;_internal_add_test;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;6;microsoft_add_library_tests;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;0;")
add_test(CommandlineUnitTests "CommandlineUnitTests" "--gtest_shuffle" "--gtest_random_seed=1337")
set_tests_properties(CommandlineUnitTests PROPERTIES  _BACKTRACE_TRIPLES "/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;21;add_test;/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;38;_internal_add_test;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;9;microsoft_add_library_tests;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;0;")
add_test(ValidatorUnitTests "ValidatorUnitTests" "--gtest_shuffle" "--gtest_random_seed=1337")
set_tests_properties(ValidatorUnitTests PROPERTIES  _BACKTRACE_TRIPLES "/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;21;add_test;/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;38;_internal_add_test;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;20;microsoft_add_library_tests;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;0;")
add_test(StaticResourceComponentUnitTests "StaticResourceComponentUnitTests" "--gtest_shuffle" "--gtest_random_seed=1337")
set_tests_properties(StaticResourceComponentUnitTests PROPERTIES  _BACKTRACE_TRIPLES "/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;21;add_test;/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;38;_internal_add_test;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;26;microsoft_add_library_tests;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;0;")
add_test(AllocationManagerUnitTests "AllocationManagerUnitTests" "--gtest_shuffle" "--gtest_random_seed=1337")
set_tests_properties(AllocationManagerUnitTests PROPERTIES  _BACKTRACE_TRIPLES "/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;21;add_test;/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;38;_internal_add_test;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;32;microsoft_add_library_tests;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;0;")
add_test(TransformationRulesPassUnitTests "TransformationRulesPassUnitTests" "--gtest_shuffle" "--gtest_random_seed=1337")
set_tests_properties(TransformationRulesPassUnitTests PROPERTIES  _BACKTRACE_TRIPLES "/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;21;add_test;/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;38;_internal_add_test;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;36;microsoft_add_library_tests;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;0;")
add_test(RulesUnitTests "RulesUnitTests" "--gtest_shuffle" "--gtest_random_seed=1337")
set_tests_properties(RulesUnitTests PROPERTIES  _BACKTRACE_TRIPLES "/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;21;add_test;/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;38;_internal_add_test;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;40;microsoft_add_library_tests;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;0;")
add_test(GeneratorsUnitTests "GeneratorsUnitTests" "--gtest_shuffle" "--gtest_random_seed=1337")
set_tests_properties(GeneratorsUnitTests PROPERTIES  _BACKTRACE_TRIPLES "/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;21;add_test;/Users/tfr/Documents/Projects/qat/cmake/Testing.cmake;38;_internal_add_test;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;46;microsoft_add_library_tests;/Users/tfr/Documents/Projects/qat/qir/qat/CMakeLists.txt;0;")
subdirs("Apps")
