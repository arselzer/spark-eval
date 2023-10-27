#!/bin/bash

SF=11

# GENDATA=yes

if [-z ${GENDATA+x} ]; then
	echo $GENDATA

	cd tpcds-kit/tools

	yes y | ./dsdgen -terminate N -verbose Y -scale $SF

	mkdir -p withnull
	for file in *.dat; do
		cat $file | sed 's/||/|\\N|/g' | sed 's/||/|\\N|/g' > withnull/$file
	done

	mv withnull/* ./

	cd ../..

fi

tables=$( ls tpcds-kit/tools/*.dat | xargs -n 1 basename | sed 's/.dat$//')

for t in $tables; do
	PGPASSWORD=tpcds psql -U tpcds -c "DROP TABLE IF EXISTS $t CASCADE;"
done

PGPASSWORD=tpcds psql -U tpcds -f dsb-create.sql

for t in $tables; do
	PGPASSWORD=tpcds psql -U tpcds -c "\copy $t from 'tpcds-kit/tools/${t}.dat' DELIMITER '|';"
done
