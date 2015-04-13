#!/bin/bash

for f in *.cbr; do
	unrar x ./"$f";
	for jf in *.jpg; do
		cwebp ./"$jf" -o ./"${jf%.jpg}.webp";
		rm ./"$jf";
	done
	zip -r ./"${f%.cbr}.cbz" *.webp;
	rm -r *.webp
	#rm ./"$f";
done

