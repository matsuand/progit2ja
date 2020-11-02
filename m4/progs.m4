CTIE=ctie/ctie$EXEEXT
AC_SUBST(CTIE)

ORIGDIR=../progit2
AC_ARG_WITH(origdir,
[  --with-origdir=DIR      Specify ORIG sources directory [[DIR=../progit2]]],
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

GITSCMDIR=../git-scm.com
AC_ARG_WITH(gitscmdir,
[  --with-gitscmdir=DIR    Specify git-scm.com directory [[DIR=../git-scm.com]]],
[
  if test -d "${with_gitscmdir}" ; then
    GITSCMDIR=${with_gitscmdir}
  fi
]
)
AC_MSG_CHECKING([for the gitscm files])
if test ! -f "${GITSCMDIR}/lib/tasks/book2.rake"; then
  AC_MSG_RESULT([no])
  AC_MSG_ERROR([The gitscm files not found in ${GITSCMDIR}])
else
  AC_MSG_RESULT([ok])
fi
AC_SUBST(GITSCMDIR)

abs_gitscmdir=`(cd $GITSCMDIR && pwd)`
AC_SUBST(abs_gitscmdir)

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
