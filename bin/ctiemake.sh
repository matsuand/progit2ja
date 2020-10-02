#!/bin/sh

rm -f Makefile.sub
#if test ! -f Makefile.sub; then
  echo "# Makefile.sub">Makefile.sub
#fi

for f in $@; do
# grep "^$f:" Makefile.sub
# if test $? != 0; then
    ext=`echo $f | sed 's/^.*\.\([^\.]*\)$/\1/'`
    base=`echo $f | sed "s/\.[^\.]*$//"`
    if test "x${ext}" = "xasc"; then
      change="ch"
    else
      change="${ext}ch"
    fi
    echo "\$(abs_installdir)/$f: \$(origdir)/\$@ \$(srcdir)/$base.$change">>Makefile.sub
    echo "	@echo Processing $f...">>Makefile.sub
    echo "	@\$(top_builddir)/\$(CTIE) -m \$(abs_installdir)/$f \$(origdir)/$f \$(srcdir)/$base.$change >/dev/null">>Makefile.sub
# fi
done

