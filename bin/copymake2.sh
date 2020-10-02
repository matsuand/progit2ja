#!/bin/sh

# The first arg:		$1		subMakefile name（ex. jsnons, others）
# The second arg:		$2		directory where the merge files will be created in
# The third arg:		$3		directory where ...
# The fourth and later args:	${@:4:($#-3)}	target filename list

name=$1
orgdir=$2
srcdir=$3
list=${@:4:($#-3)}

rm -f $name.sub
echo "# $name.sub">$name.sub

for f in $list; do
target=`grep "^$f:" $name.sub`
    echo "$srcdir/$f: $orgdir/$f" >> $name.sub
    echo "	@echo Copying $f..." >> $name.sub
    echo "	@cp -p \$^ \$@" >> $name.sub
done
