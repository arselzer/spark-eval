#!/bin/bash

SF=1
DATADIR=$(pwd)/lsqb/data/social-network-sf${SF}-merged-fk

PGPASSWORD=lsqb psql -U lsqb -f lsqb/sql/drop.sql
PGPASSWORD=lsqb psql -U lsqb -f lsqb/sql/schema.sql

sed "s|PATHVAR|${DATADIR}|" lsqb/sql/snb-load.sql | sed 's|COPY|\\copy|' | PGPASSWORD=lsqb psql -U lsqb

PGPASSWORD=lsqb psql -U lsqb -f lsqb/sql/views.sql

