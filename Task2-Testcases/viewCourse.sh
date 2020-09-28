#!/usr/bin/bash
a=3;
if (grep -q -F "(B[m" $1);
then a=4; 
fi;
b=$(($a+1));
awk 'NR<4' "$1"
awk -v a=$a -v b=$b -v s="$2" '$a FS $b~s&&NR>3 { print $0;}' "$1" | sort -k $a,$b;
