# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/t-wuli/Monkey

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/t-wuli/Monkey

# Include any dependencies generated for this target.
include CMakeFiles/Monkey.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Monkey.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Monkey.dir/flags.make

CMakeFiles/Monkey.dir/src/mk_palloc.c.o: CMakeFiles/Monkey.dir/flags.make
CMakeFiles/Monkey.dir/src/mk_palloc.c.o: src/mk_palloc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/t-wuli/Monkey/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Monkey.dir/src/mk_palloc.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Monkey.dir/src/mk_palloc.c.o   -c /home/t-wuli/Monkey/src/mk_palloc.c

CMakeFiles/Monkey.dir/src/mk_palloc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Monkey.dir/src/mk_palloc.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/t-wuli/Monkey/src/mk_palloc.c > CMakeFiles/Monkey.dir/src/mk_palloc.c.i

CMakeFiles/Monkey.dir/src/mk_palloc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Monkey.dir/src/mk_palloc.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/t-wuli/Monkey/src/mk_palloc.c -o CMakeFiles/Monkey.dir/src/mk_palloc.c.s

CMakeFiles/Monkey.dir/src/mk_vector.c.o: CMakeFiles/Monkey.dir/flags.make
CMakeFiles/Monkey.dir/src/mk_vector.c.o: src/mk_vector.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/t-wuli/Monkey/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/Monkey.dir/src/mk_vector.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Monkey.dir/src/mk_vector.c.o   -c /home/t-wuli/Monkey/src/mk_vector.c

CMakeFiles/Monkey.dir/src/mk_vector.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Monkey.dir/src/mk_vector.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/t-wuli/Monkey/src/mk_vector.c > CMakeFiles/Monkey.dir/src/mk_vector.c.i

CMakeFiles/Monkey.dir/src/mk_vector.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Monkey.dir/src/mk_vector.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/t-wuli/Monkey/src/mk_vector.c -o CMakeFiles/Monkey.dir/src/mk_vector.c.s

CMakeFiles/Monkey.dir/src/test.c.o: CMakeFiles/Monkey.dir/flags.make
CMakeFiles/Monkey.dir/src/test.c.o: src/test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/t-wuli/Monkey/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/Monkey.dir/src/test.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Monkey.dir/src/test.c.o   -c /home/t-wuli/Monkey/src/test.c

CMakeFiles/Monkey.dir/src/test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Monkey.dir/src/test.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/t-wuli/Monkey/src/test.c > CMakeFiles/Monkey.dir/src/test.c.i

CMakeFiles/Monkey.dir/src/test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Monkey.dir/src/test.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/t-wuli/Monkey/src/test.c -o CMakeFiles/Monkey.dir/src/test.c.s

# Object files for target Monkey
Monkey_OBJECTS = \
"CMakeFiles/Monkey.dir/src/mk_palloc.c.o" \
"CMakeFiles/Monkey.dir/src/mk_vector.c.o" \
"CMakeFiles/Monkey.dir/src/test.c.o"

# External object files for target Monkey
Monkey_EXTERNAL_OBJECTS =

Monkey: CMakeFiles/Monkey.dir/src/mk_palloc.c.o
Monkey: CMakeFiles/Monkey.dir/src/mk_vector.c.o
Monkey: CMakeFiles/Monkey.dir/src/test.c.o
Monkey: CMakeFiles/Monkey.dir/build.make
Monkey: CMakeFiles/Monkey.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/t-wuli/Monkey/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable Monkey"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Monkey.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Monkey.dir/build: Monkey

.PHONY : CMakeFiles/Monkey.dir/build

CMakeFiles/Monkey.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Monkey.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Monkey.dir/clean

CMakeFiles/Monkey.dir/depend:
	cd /home/t-wuli/Monkey && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/t-wuli/Monkey /home/t-wuli/Monkey /home/t-wuli/Monkey /home/t-wuli/Monkey /home/t-wuli/Monkey/CMakeFiles/Monkey.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Monkey.dir/depend

