# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/t-wuli/Monkey/CMakeFiles /home/t-wuli/Monkey/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/t-wuli/Monkey/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named Monkey

# Build rule for target.
Monkey: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 Monkey
.PHONY : Monkey

# fast build rule for target.
Monkey/fast:
	$(MAKE) -f CMakeFiles/Monkey.dir/build.make CMakeFiles/Monkey.dir/build
.PHONY : Monkey/fast

src/mk_palloc.o: src/mk_palloc.c.o

.PHONY : src/mk_palloc.o

# target to build an object file
src/mk_palloc.c.o:
	$(MAKE) -f CMakeFiles/Monkey.dir/build.make CMakeFiles/Monkey.dir/src/mk_palloc.c.o
.PHONY : src/mk_palloc.c.o

src/mk_palloc.i: src/mk_palloc.c.i

.PHONY : src/mk_palloc.i

# target to preprocess a source file
src/mk_palloc.c.i:
	$(MAKE) -f CMakeFiles/Monkey.dir/build.make CMakeFiles/Monkey.dir/src/mk_palloc.c.i
.PHONY : src/mk_palloc.c.i

src/mk_palloc.s: src/mk_palloc.c.s

.PHONY : src/mk_palloc.s

# target to generate assembly for a file
src/mk_palloc.c.s:
	$(MAKE) -f CMakeFiles/Monkey.dir/build.make CMakeFiles/Monkey.dir/src/mk_palloc.c.s
.PHONY : src/mk_palloc.c.s

src/mk_vector.o: src/mk_vector.c.o

.PHONY : src/mk_vector.o

# target to build an object file
src/mk_vector.c.o:
	$(MAKE) -f CMakeFiles/Monkey.dir/build.make CMakeFiles/Monkey.dir/src/mk_vector.c.o
.PHONY : src/mk_vector.c.o

src/mk_vector.i: src/mk_vector.c.i

.PHONY : src/mk_vector.i

# target to preprocess a source file
src/mk_vector.c.i:
	$(MAKE) -f CMakeFiles/Monkey.dir/build.make CMakeFiles/Monkey.dir/src/mk_vector.c.i
.PHONY : src/mk_vector.c.i

src/mk_vector.s: src/mk_vector.c.s

.PHONY : src/mk_vector.s

# target to generate assembly for a file
src/mk_vector.c.s:
	$(MAKE) -f CMakeFiles/Monkey.dir/build.make CMakeFiles/Monkey.dir/src/mk_vector.c.s
.PHONY : src/mk_vector.c.s

src/test.o: src/test.c.o

.PHONY : src/test.o

# target to build an object file
src/test.c.o:
	$(MAKE) -f CMakeFiles/Monkey.dir/build.make CMakeFiles/Monkey.dir/src/test.c.o
.PHONY : src/test.c.o

src/test.i: src/test.c.i

.PHONY : src/test.i

# target to preprocess a source file
src/test.c.i:
	$(MAKE) -f CMakeFiles/Monkey.dir/build.make CMakeFiles/Monkey.dir/src/test.c.i
.PHONY : src/test.c.i

src/test.s: src/test.c.s

.PHONY : src/test.s

# target to generate assembly for a file
src/test.c.s:
	$(MAKE) -f CMakeFiles/Monkey.dir/build.make CMakeFiles/Monkey.dir/src/test.c.s
.PHONY : src/test.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... Monkey"
	@echo "... edit_cache"
	@echo "... src/mk_palloc.o"
	@echo "... src/mk_palloc.i"
	@echo "... src/mk_palloc.s"
	@echo "... src/mk_vector.o"
	@echo "... src/mk_vector.i"
	@echo "... src/mk_vector.s"
	@echo "... src/test.o"
	@echo "... src/test.i"
	@echo "... src/test.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

