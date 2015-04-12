#!/bin/bash

for f in *.cbr; do
	unrar x ./"$f";	
done

