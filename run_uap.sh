#!/bin/sh

BIN_DIR=`cd $(dirname $0);pwd`

export NC_HOME=$BIN_DIR/UAP
export JAVA_HOME=$BIN_DIR/openjdk
echo $NC_HOME


PLATFORM=`/bin/uname`
ARCH=`/bin/uname -m`

ANT_HOME=${NC_HOME}/ant
NC_JAVA_HOME=
BIN_HOME=${NC_HOME}/bin
TOMCAT_HOME=${NC_HOME}
ANT_OPTS="-Xmx512m -XX:MaxPermSize=512m"

NC_LOGIN_JAR_CONF=${NC_HOME}/ierp/bin/jarversion.ini
NC_LOGIN_JAR_PATH=${NC_HOME}/webapps/nc_web/Client/appletjar
NC_LOGIN_JAR_VERSION=`cat ${NC_LOGIN_JAR_CONF}`
NC_LOGIN_JAR=${NC_LOGIN_JAR_PATH}/${NC_LOGIN_JAR_VERSION}

# LOGLEVEL is DEBUG, ERROR
LOGLEVEL=ERROR

NC_STORE_FILE=${BIN_HOME}/cert/ufida.jks
NC_CERT_FILE=${BIN_HOME}/cert/ufida.cer
NC_STORE_PASS=ufidauap
NC_STORE_TYPE=JKS
NC_STORE_ALIAS=ufida

PATH=${JAVA_HOME}/bin:${ANT_HOME}/bin:${PATH}
NC_CLASSPATH=.:"${NC_HOME}/starter.jar":"${JAVA_HOME}/lib/tools.jar":"${ANT_HOME}/lib/ant-launcher.jar":"${NC_HOME}/lib/cnytiruces.jar"

sed -i "s/<port>[0-9]*<\/port>/<port>${PORT}<\/port>/g" ${NC_HOME}/ierp/bin/prop.xml
cd ${NC_HOME}
${JAVA_HOME}/bin/java -classpath ${NC_CLASSPATH} -Dnc.bs.logging.format=text -Dnc.server.location=${NC_HOME} nc.bs.mw.start.NCStarter

