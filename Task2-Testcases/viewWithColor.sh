#!/bin/bash
source ./resources/defineColors.sh

awk -v RESET_ALL="$RESET_ALL" '
			BEGIN {
				FS=",";
				fontcol["BLACK_FONT"]="'$BLACK_FONT'";
				fontcol["RED_FONT"]="'$RED_FONT'";
				fontcol["GREEN_FONT"]="'$GREEN_FONT'";
				fontcol["YELLOW_FONT"]="'$YELLOW_FONT'";
				fontcol["BLUE_FONT"]="'$BLUE_FONT'";
				fontcol["MAGENTA_FONT"]="'$MAGENTA_FONT'";
				fontcol["CYAN_FONT"]="'$CYAN_FONT'";
				fontcol["WHITE_FONT"]="'$WHITE_FONT'";

				backcol["BLACK_BACKGROUND"]="'$BLACK_BACKGROUND'";
				backcol["RED_BACKGROUND"]="'$RED_BACKGROUND'";
				backcol["GREEN_BACKGROUND"]="'$GREEN_BACKGROUND'";
				backcol["YELLOW_BACKGROUND"]="'$YELLOW_BACKGROUND'";
				backcol["BLUE_BACKGROUND"]="'$BLUE_BACKGROUND'";
				backcol["MAGENTA_BACKGROUND"]="'$MAGENTA_BACKGROUND'";
				backcol["CYAN_BACKGROUND"]="'$CYAN_BACKGROUND'";
				backcol["WHITE_BACKGROUND"]="'$WHITE_BACKGROUND'";
			}
			{
				if (NR>FNR && FNR<4) {
					print $0;
				}
				else if (NR>1 && FNR==NR) {
					coursefont[$1]=fontcol[$3"_FONT"]; 
					courseback[$1]=backcol[$4"_BACKGROUND"];
				}
				else {
					for (i in coursefont) {
						if(substr($0, 80, 21) ~ i) {
							print courseback[i] coursefont[i] $0 RESET_ALL; 
						}
					}
				}
			}
		' $2 $1;
