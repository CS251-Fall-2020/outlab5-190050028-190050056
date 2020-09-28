#!/bin/bash
awk '
BEGIN { FS=","; RS="\r\n";}
	       {if(FNR>1 && NR==FNR) { price[$1]=$2;next;}}
	       FNR>1 {x+=$5; y+=$5*price[$7];}
           END{printf"%.4f", y/x;}' "$2" "$1";
