#!/bin/sh

# The first arg:		$1		subMakefile name（ex. jsnons, others）
# The second and later args:	$2		to-directory
# The third arg:		${@:3:($#-2)}	target filename list

name=$1
list=${@:3:($#-2)}

echo "outdir: " ${outdir}

if test ! -f $name.sub; then
  echo "# $name.sub">$name.sub
fi

for f in $list; do
  target=`grep "\/$f:" $name.sub`
  if test "x${target}"="x"; then
    echo "\${abs_installdir}/$2/$f: \$(origdir)/$f" >> $name.sub
    echo "	@echo Copying \$@... #" $outdir >> $name.sub
    echo "	@cp -p \$^ \$@" >> $name.sub
  fi
done

