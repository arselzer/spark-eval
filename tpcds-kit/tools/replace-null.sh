#!/bin/bash

for file in *.dat; do
	cat $file | sed 's/||/|\\N|/g' | sed -e 's/||/|\\N|/g' -e 's/^|/\\N|/g' -e 's/|$/|\\N/g'  > withnull/$file
done
