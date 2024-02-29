#!/bin/bash
export HADOOP_CLASSPATH=$(/hadoop/bin/hadoop classpath)
exec "/docker-entrypoint.sh" "$@"
