#!/bin/bash

PGPASSWORD=snap psql -U snap -d snap -f import-snap.sql
