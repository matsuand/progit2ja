origdir=../progit2
AC_ARG_WITH(origdir,
[  --with-origdir=DIR      Specify ORIG sources directory [[DIR=../progit2]]],
[
  if test -d "${with_origdir}" ; then
    origdir=${with_origdir}
  fi
]
)
AC_MSG_CHECKING([for the original files])
if test ! -f "${origdir}/progit.asc"; then
  AC_MSG_RESULT([no])
  AC_MSG_ERROR([The original files not found in ${origdir}])
else
  AC_MSG_RESULT([ok])
fi
AC_SUBST(origdir)

abs_origdir=`(cd $origdir && pwd)`
AC_SUBST(abs_origdir)
