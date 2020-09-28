#!/usr/bin/bash
a=3;
if (grep -q -F "(B[m" $1);
then a=4; 
fi;
b=$(($a+1));
sed -n "/$2/p" "$1"|sort -k $a,$b;