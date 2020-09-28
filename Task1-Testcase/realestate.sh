#!/bin/bash
if [ $# -ne 3 ]
	then 
		echo "./realestate.sh <file1> <file2> <file3>"
		exit 1
fi

awk -F "," '{income=0; rate=$4; for (i=0; i<$3; i++) {income=income+12*(int(0.9*rate*$2)-$6); rate=int(rate*(1+$5/100));} print $1","income","$3;}' $1 > $2
sort --field-separator=',' -k2nr,2 -k3n,3 -o $2 $2
awk -F "," '{print $1}' $2 > $3 
