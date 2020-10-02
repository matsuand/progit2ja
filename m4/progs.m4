CTIE=ctie/ctie$EXEEXT
AC_SUBST(CTIE)

ORIGDIR=../progit2.git
AC_ARG_WITH(origdir,
[  --with-origdir=DIR      Specify ORIG sources directory [[DIR=../progit2.git]]],
[
  if test -d "${with_origdir}" ; then
    ORIGDIR=${with_origdir}
  fi
]
)
AC_MSG_CHECKING([for the original files])
if test ! -f "${ORIGDIR}/A-git-in-other-environments.asc"; then
  AC_MSG_RESULT([no])
  AC_MSG_ERROR([The original files not found in ${ORIGDIR}])
else
  AC_MSG_RESULT([ok])
fi
AC_SUBST(ORIGDIR)

abs_origdir=`(cd $ORIGDIR && pwd)`
AC_SUBST(abs_origdir)

INSTALLDIR=.
AC_ARG_WITH(installdir,
[  --with-installdir=DIR    Specify build dir [[INSTALLDIR=.]]],
[
  if test "${with_installdir}" ; then
    INSTALLDIR=${with_installdir}
    if test ! -d "$INSTALLDIR" ; then
      $MKDIR_P "$INSTALLDIR"
    fi
  else
    AC_MSG_ERROR([Should be specified build dir with --with-installdir])
  fi
]
)
AC_SUBST(INSTALLDIR)
abs_installdir=`(cd $INSTALLDIR && pwd)`
AC_SUBST(abs_installdir)
