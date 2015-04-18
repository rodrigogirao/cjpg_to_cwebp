#!/bin/bash
cd "$@";
find $(pwd) -type d -links 2 > outtemp.txt
IFS='';
while read line; do
	cd $line;
	echo "========== $line ==========";
	for f in *.cbz; do	
		unzip ./"$f";
		for jf in *.jpg; do
			cwebp ./"$jf" -o ./"${jf%.jpg}.webp";
			rm ./"$jf";
		done
		for pf in *.png; do
			cwebp ./"$pf" -o ./"${pf%.png}.webp";
			rm ./"$pf";
		done
		zip -r ./"${f%.cbz}_webp.cbz" *.webp;
		rm -r *.webp;
		#rm ./"$f";
	done
	
	for f in *.cbr; do	
		unzip ./"$f";
		for jf in *.jpg; do
			cwebp ./"$jf" -o ./"${jf%.jpg}.webp";
			rm ./"$jf";
		done
		for pf in *.png; do
			cwebp ./"$pf" -o ./"${pf%.png}.webp";
			rm ./"$pf";
		done
		zip -r ./"${f%.cbr}_webp.cbz" *.webp;
		rm -r *.webp;
		#rm ./"$f";
	done
done < outtemp.txt
