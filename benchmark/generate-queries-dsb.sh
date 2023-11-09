#!/bin/bash

## Generate all queries
#./dsb/code/tools/dsqgen -dialect postgres -directory query_templates_pg/agg_queries -input query_templates_pg/agg_queries/templates.lst -output_dir queries -terminate N -force -verbose y


## Generate queries one by one
mkdir -p dsb-queries
for dir in dsb/query_templates_pg/*; do
	basedir=$(basename $dir)
	mkdir -p dsb-queries/$basedir
	for f in $dir/*.tpl; do
		query=$(basename $f .tpl)
		./dsb/code/tools/dsqgen -directory $dir -template ${query}.tpl -output_dir dsb-queries/$basedir -dialect postgres
		mv dsb-queries/$basedir/query_0.sql dsb-queries/$basedir/${query}.sql
	done
done
