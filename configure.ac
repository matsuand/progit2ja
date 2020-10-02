#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([progit2ja], [0.0.1], [30614168+matsuand@users.noreply.github.com])
AC_CONFIG_SRCDIR([ctie/ctie-k.c])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE([-Wno-portability])
AM_MAINTAINER_MODE

m4_include([m4/progs.m4])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([malloc.h stdlib.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([strerror])

AC_CONFIG_FILES([Makefile
		book/Makefile
		book/01-introduction/Makefile
		book/01-introduction/sections/Makefile
		book/02-git-basics/Makefile
		book/02-git-basics/sections/Makefile
		book/03-git-branching/Makefile
		book/03-git-branching/sections/Makefile
		book/04-git-server/Makefile
		book/04-git-server/sections/Makefile
		book/05-distributed-git/Makefile
		book/05-distributed-git/sections/Makefile
		book/06-github/Makefile
		book/06-github/sections/Makefile
		book/07-git-tools/Makefile
		book/07-git-tools/sections/Makefile
		book/08-customizing-git/Makefile
		book/08-customizing-git/sections/Makefile
		book/09-git-and-other-scms/Makefile
		book/09-git-and-other-scms/sections/Makefile
		book/10-git-internals/Makefile
		book/10-git-internals/sections/Makefile
		book/A-git-in-other-environments/Makefile
		book/A-git-in-other-environments/sections/Makefile
		book/B-embedding-git/Makefile
		book/B-embedding-git/sections/Makefile
		ctie/Makefile
		images/Makefile])
AC_OUTPUT
