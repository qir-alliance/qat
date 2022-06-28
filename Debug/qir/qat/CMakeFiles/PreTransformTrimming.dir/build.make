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
include qir/qat/CMakeFiles/PreTransformTrimming.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include qir/qat/CMakeFiles/PreTransformTrimming.dir/compiler_depend.make

# Include the progress variables for this target.
include qir/qat/CMakeFiles/PreTransformTrimming.dir/progress.make

# Include the compile flags for this target's objects.
include qir/qat/CMakeFiles/PreTransformTrimming.dir/flags.make

qir/qat/CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.o: qir/qat/CMakeFiles/PreTransformTrimming.dir/flags.make
qir/qat/CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.o: ../qir/qat/PreTransformTrimming/PreTransformTrimmingPass.cpp
qir/qat/CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.o: qir/qat/CMakeFiles/PreTransformTrimming.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tfr/Documents/Projects/qat/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object qir/qat/CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.o"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT qir/qat/CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.o -MF CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.o.d -o CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.o -c /Users/tfr/Documents/Projects/qat/qir/qat/PreTransformTrimming/PreTransformTrimmingPass.cpp

qir/qat/CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.i"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tfr/Documents/Projects/qat/qir/qat/PreTransformTrimming/PreTransformTrimmingPass.cpp > CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.i

qir/qat/CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.s"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tfr/Documents/Projects/qat/qir/qat/PreTransformTrimming/PreTransformTrimmingPass.cpp -o CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.s

# Object files for target PreTransformTrimming
PreTransformTrimming_OBJECTS = \
"CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.o"

# External object files for target PreTransformTrimming
PreTransformTrimming_EXTERNAL_OBJECTS =

qir/qat/libPreTransformTrimming.a: qir/qat/CMakeFiles/PreTransformTrimming.dir/PreTransformTrimming/PreTransformTrimmingPass.cpp.o
qir/qat/libPreTransformTrimming.a: qir/qat/CMakeFiles/PreTransformTrimming.dir/build.make
qir/qat/libPreTransformTrimming.a: qir/qat/CMakeFiles/PreTransformTrimming.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tfr/Documents/Projects/qat/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libPreTransformTrimming.a"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && $(CMAKE_COMMAND) -P CMakeFiles/PreTransformTrimming.dir/cmake_clean_target.cmake
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/PreTransformTrimming.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
qir/qat/CMakeFiles/PreTransformTrimming.dir/build: qir/qat/libPreTransformTrimming.a
.PHONY : qir/qat/CMakeFiles/PreTransformTrimming.dir/build

qir/qat/CMakeFiles/PreTransformTrimming.dir/clean:
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && $(CMAKE_COMMAND) -P CMakeFiles/PreTransformTrimming.dir/cmake_clean.cmake
.PHONY : qir/qat/CMakeFiles/PreTransformTrimming.dir/clean

qir/qat/CMakeFiles/PreTransformTrimming.dir/depend:
	cd /Users/tfr/Documents/Projects/qat/Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tfr/Documents/Projects/qat /Users/tfr/Documents/Projects/qat/qir/qat /Users/tfr/Documents/Projects/qat/Debug /Users/tfr/Documents/Projects/qat/Debug/qir/qat /Users/tfr/Documents/Projects/qat/Debug/qir/qat/CMakeFiles/PreTransformTrimming.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : qir/qat/CMakeFiles/PreTransformTrimming.dir/depend

