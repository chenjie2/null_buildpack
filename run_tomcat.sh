#!/bin/sh

BIN_DIR=$(dirname $0)
export JAVA_HOME=$BIN_DIR/../../openjdk
export CATALINA_OPTS="-Dhttp.port=$PORT $CATALINA_OPTS"

exec $BIN_DIR/catalina.sh run
