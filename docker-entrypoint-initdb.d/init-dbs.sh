#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
	create user snap with password 'snap';
	create database snap;
	grant all privileges on database snap to snap;

	create user snap with password 'tpcds';
	create database tpcds;
	grant all privileges on database tpcds to tpcds;

	create user snap with password 'tpch';
	create database tpch;
	grant all privileges on database tpch to tpch;

EOSQL
