#!/bin/bash
awk '
BEGIN { FS=","; RS="\r\n";}
	       {if(FNR>1 && NR==FNR) { price[$1]=$2;next;}}
	       FNR>1 {x+=$5; y+=$5*price[$7];}
           END{if(x!=0){printf"%.4f\n", y/x;} else{printf"%.1f\n", "0";}}' "$2" "$1";
