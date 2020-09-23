#!/bin/awk -f
BEGIN {
	FS="," 
	RS="\r\n"
	namecol=0
	getline
	for (i=1; i<=NF; i++) {
		if ($i != "Name") {
			for (j=0; j<20; j++) {
				printf("-")
			}
		}
	}
	printf("\n")
	for (i=1; i<=NF; i++) {
		if ($i != "Name") {
			printf("%20s",$i)
		}
		else namecol=i
	}
	printf("\n")
	for (i=1; i<=NF; i++) {
		if ($i != "Name") {
			for (j=0; j<20; j++) printf("-")
		}
	}
	printf("\n")
}
{
	for (i=1; i<=NF; i++) {
		if (i!=namecol) printf("%20s",$i);
	}
	printf("\n")
}
