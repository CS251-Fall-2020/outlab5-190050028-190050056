#!/usr/bin/bash
 # shellcheck source=./resources/defineColors.sh
source ./resources/defineColors.sh

echo "$BLACK_BACKGROUND $WHITE_FONT hello! $RESET_ALL";
awk '
			BEGIN {FS=","; RS="\r\n";}
			{if(NR>1) {fontcol[$1]=$3"_FONT"; backcol[$1]=$4"_BACKGROUND";}}
			END { for (i in fontcol) {
							print "'$fontcol[i]'", "'$backcol[i]'";
					}
			}' $2
