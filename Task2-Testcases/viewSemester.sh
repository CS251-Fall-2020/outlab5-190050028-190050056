#!/bin/bash
a=3;
if (grep -q -F "(B[m" $1);
then a=4; 
fi;
b=$(($a+1));
awk '/'$2'/&&/'$3'/ {print $0;}' "$1" | sort -k $a,$b;
