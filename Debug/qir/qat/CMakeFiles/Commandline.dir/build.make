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
include qir/qat/CMakeFiles/Commandline.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include qir/qat/CMakeFiles/Commandline.dir/compiler_depend.make

# Include the progress variables for this target.
include qir/qat/CMakeFiles/Commandline.dir/progress.make

# Include the compile flags for this target's objects.
include qir/qat/CMakeFiles/Commandline.dir/flags.make

qir/qat/CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.o: qir/qat/CMakeFiles/Commandline.dir/flags.make
qir/qat/CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.o: ../qir/qat/Commandline/ConfigurationManager.cpp
qir/qat/CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.o: qir/qat/CMakeFiles/Commandline.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tfr/Documents/Projects/qat/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object qir/qat/CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.o"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT qir/qat/CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.o -MF CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.o.d -o CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.o -c /Users/tfr/Documents/Projects/qat/qir/qat/Commandline/ConfigurationManager.cpp

qir/qat/CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.i"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tfr/Documents/Projects/qat/qir/qat/Commandline/ConfigurationManager.cpp > CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.i

qir/qat/CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.s"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tfr/Documents/Projects/qat/qir/qat/Commandline/ConfigurationManager.cpp -o CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.s

qir/qat/CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.o: qir/qat/CMakeFiles/Commandline.dir/flags.make
qir/qat/CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.o: ../qir/qat/Commandline/IConfigBind.cpp
qir/qat/CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.o: qir/qat/CMakeFiles/Commandline.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tfr/Documents/Projects/qat/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object qir/qat/CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.o"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT qir/qat/CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.o -MF CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.o.d -o CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.o -c /Users/tfr/Documents/Projects/qat/qir/qat/Commandline/IConfigBind.cpp

qir/qat/CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.i"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tfr/Documents/Projects/qat/qir/qat/Commandline/IConfigBind.cpp > CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.i

qir/qat/CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.s"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tfr/Documents/Projects/qat/qir/qat/Commandline/IConfigBind.cpp -o CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.s

qir/qat/CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.o: qir/qat/CMakeFiles/Commandline.dir/flags.make
qir/qat/CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.o: ../qir/qat/Commandline/ParameterParser.cpp
qir/qat/CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.o: qir/qat/CMakeFiles/Commandline.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/tfr/Documents/Projects/qat/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object qir/qat/CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.o"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT qir/qat/CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.o -MF CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.o.d -o CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.o -c /Users/tfr/Documents/Projects/qat/qir/qat/Commandline/ParameterParser.cpp

qir/qat/CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.i"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/tfr/Documents/Projects/qat/qir/qat/Commandline/ParameterParser.cpp > CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.i

qir/qat/CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.s"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/tfr/Documents/Projects/qat/qir/qat/Commandline/ParameterParser.cpp -o CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.s

# Object files for target Commandline
Commandline_OBJECTS = \
"CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.o" \
"CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.o" \
"CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.o"

# External object files for target Commandline
Commandline_EXTERNAL_OBJECTS =

qir/qat/libCommandline.a: qir/qat/CMakeFiles/Commandline.dir/Commandline/ConfigurationManager.cpp.o
qir/qat/libCommandline.a: qir/qat/CMakeFiles/Commandline.dir/Commandline/IConfigBind.cpp.o
qir/qat/libCommandline.a: qir/qat/CMakeFiles/Commandline.dir/Commandline/ParameterParser.cpp.o
qir/qat/libCommandline.a: qir/qat/CMakeFiles/Commandline.dir/build.make
qir/qat/libCommandline.a: qir/qat/CMakeFiles/Commandline.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/tfr/Documents/Projects/qat/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library libCommandline.a"
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && $(CMAKE_COMMAND) -P CMakeFiles/Commandline.dir/cmake_clean_target.cmake
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Commandline.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
qir/qat/CMakeFiles/Commandline.dir/build: qir/qat/libCommandline.a
.PHONY : qir/qat/CMakeFiles/Commandline.dir/build

qir/qat/CMakeFiles/Commandline.dir/clean:
	cd /Users/tfr/Documents/Projects/qat/Debug/qir/qat && $(CMAKE_COMMAND) -P CMakeFiles/Commandline.dir/cmake_clean.cmake
.PHONY : qir/qat/CMakeFiles/Commandline.dir/clean

qir/qat/CMakeFiles/Commandline.dir/depend:
	cd /Users/tfr/Documents/Projects/qat/Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/tfr/Documents/Projects/qat /Users/tfr/Documents/Projects/qat/qir/qat /Users/tfr/Documents/Projects/qat/Debug /Users/tfr/Documents/Projects/qat/Debug/qir/qat /Users/tfr/Documents/Projects/qat/Debug/qir/qat/CMakeFiles/Commandline.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : qir/qat/CMakeFiles/Commandline.dir/depend

