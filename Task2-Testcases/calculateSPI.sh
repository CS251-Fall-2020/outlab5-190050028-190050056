#!/bin/bash
awk -v year="$4" -v sem="$3" '
BEGIN { FS=","; RS="\r\n";}
	       {if(FNR>1 && NR==FNR) { price[$1]=$2;next;}}
	       {if($0~year&&$0~sem&&FNR>1) {x+=$5; y+=$5*price[$7];}}
		   {x=0;}
           END{if(x!=0){printf"%.4f\n", y/x;} else{printf"%.1f\n", "0";}}' "$2" "$1";
