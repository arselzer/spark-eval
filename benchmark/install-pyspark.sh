#!/bin/bash

if [ ! -f  pyspark-3.5.0.dev0.tar.gz ]; then
	wget https://github.com/arselzer/spark/releases/download/v3/pyspark-3.5.0.dev0.tar.gz
fi

pip3 install pyspark-3.5.0.dev0.tar.gz
