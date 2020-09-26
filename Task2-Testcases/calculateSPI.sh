#!/bin/bash
awk -v year=$4 -v sem=$3 '
BEGIN { FS=","; RS="\r\n";}
	       {if(FNR>1 && NR==FNR) { price[$1]=$2;next;}}
	       /year/&&FNR>1 {x+=$5; y+=$5*price[$7]; print x FS y;}
           END{printf"%.4f", y/x;}' "$2" "$1";