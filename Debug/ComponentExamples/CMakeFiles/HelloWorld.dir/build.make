# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.23.2/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.23.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/tfr/Documents/Projects/qat

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/tfr/Documents/Projects/qat/Debug

# Include any dependencies generated for this target.
include ComponentExamples/CMakeFiles/HelloWorld.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include ComponentExamples/CMakeFiles/HelloWorld.dir/compiler_depend.make

# Include the progress variables for this target.
include ComponentExamples/CMakeFiles/HelloWorld.dir/progress.make

# Include the compile flags for this target's objects.
include ComponentExamples/CMakeFiles/HelloWorld.dir/flags.make

ComponentExamples/CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o: ComponentExamples/CMakeFiles/HelloWorld.dir/flags.make
ComponentExamples/CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o: ../ComponentExamples/HelloWorld/main.cpp
ComponentExamples/CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o: ComponentExamples/CMakeFiles/HelloWorld.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tfr/Documents/Projects/qat/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ComponentExamples/CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o"
	cd /Users/tfr/Documents/Projects/qat/Debug/ComponentExamples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT ComponentExamples/CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o -MF CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o.d -o CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o -c /Users/tfr/Documents/Projects/qat/ComponentExamples/HelloWorld/main.cpp

ComponentExamples/CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.i"
	cd /Users/tfr/Documents/Projects/qat/Debug/ComponentExamples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tfr/Documents/Projects/qat/ComponentExamples/HelloWorld/main.cpp > CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.i

ComponentExamples/CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.s"
	cd /Users/tfr/Documents/Projects/qat/Debug/ComponentExamples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tfr/Documents/Projects/qat/ComponentExamples/HelloWorld/main.cpp -o CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.s

# Object files for target HelloWorld
HelloWorld_OBJECTS = \
"CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o"

# External object files for target HelloWorld
HelloWorld_EXTERNAL_OBJECTS =

ComponentExamples/libHelloWorld.dylib: ComponentExamples/CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o
ComponentExamples/libHelloWorld.dylib: ComponentExamples/CMakeFiles/HelloWorld.dir/build.make
ComponentExamples/libHelloWorld.dylib: ComponentExamples/CMakeFiles/HelloWorld.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tfr/Documents/Projects/qat/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libHelloWorld.dylib"
	cd /Users/tfr/Documents/Projects/qat/Debug/ComponentExamples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HelloWorld.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ComponentExamples/CMakeFiles/HelloWorld.dir/build: ComponentExamples/libHelloWorld.dylib
.PHONY : ComponentExamples/CMakeFiles/HelloWorld.dir/build

ComponentExamples/CMakeFiles/HelloWorld.dir/clean:
	cd /Users/tfr/Documents/Projects/qat/Debug/ComponentExamples && $(CMAKE_COMMAND) -P CMakeFiles/HelloWorld.dir/cmake_clean.cmake
.PHONY : ComponentExamples/CMakeFiles/HelloWorld.dir/clean

ComponentExamples/CMakeFiles/HelloWorld.dir/depend:
	cd /Users/tfr/Documents/Projects/qat/Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tfr/Documents/Projects/qat /Users/tfr/Documents/Projects/qat/ComponentExamples /Users/tfr/Documents/Projects/qat/Debug /Users/tfr/Documents/Projects/qat/Debug/ComponentExamples /Users/tfr/Documents/Projects/qat/Debug/ComponentExamples/CMakeFiles/HelloWorld.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ComponentExamples/CMakeFiles/HelloWorld.dir/depend

