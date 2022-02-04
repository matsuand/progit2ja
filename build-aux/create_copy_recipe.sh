#!/bin/sh

# The first arg:		$1		makefile name
# The second arg:		$2		directory name for source
# The third arg:		$3		directory prefix for target sources
# The fourth and later args:	${@:4:($#-3)}	target filename list

name=$1
dirname=$2
suffix=$3
list=${@:4:($#-3)}

if test ! -d $dirname; then
  mkdir -p $dirname
fi

rm -f $name
echo "# $name">$name

for f in $list; do
    echo "$suffix/$f: $dirname/$f" >> $name
    echo "	@mkdir -p \$(@D)" >> $name
    echo "	@cp -p \$^ \$@" >> $name
done
