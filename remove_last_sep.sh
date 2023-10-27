#!/bin/bash

for f in dsb/code/tools/*.dat; do
	cat $f | sed s'/.$//' > dsb-tables/$(basename $f)
done
