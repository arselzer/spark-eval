#!/bin/bash

SF=50

PGPASSWORD=tpch psql -U tpch -f tpch-drop.sql

cd tpch-kit/dbgen

yes y | ./dbgen -s $SF

cd ../..

tables=$( ls tpch-kit/dbgen/*.tbl | xargs -n 1 basename | sed 's/.tbl$//')

for t in $tables; do
	PGPASSWORD=tpch psql -U tpch -c "\copy $t from 'tpch-kit/dbgen/${t}.tbl' DELIMITER '|';"
done
