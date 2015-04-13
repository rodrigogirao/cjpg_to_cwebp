#!/bin/bash

for f in *.cbr; do
	unrar x ./"$f";
	for jf in *.jpg; do
		cwebp ./"$jf" -o ./"${jf%.jpg}.webp";
		rm ./"$jf";
	done
done

