#!/bin/bash

PGPASSWORD=snap psql -U snap -f import-snap.sql
