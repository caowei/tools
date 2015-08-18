#!/bin/sh
if [ $# -ne 2 ]; then
    echo "Usage $0 start/stop instance-name"
    exit -1
fi

if [ $1 != "start" -a $1 != "stop" -a $1 != "debug" ]; then
    echo "Please define the action : start or stop or debug"
    exit -1
fi

#JAVA_HOME="/usr/local/jdk1.7"
CATALINA_HOME="/apps/apache/tomcat"
CATALINA_BASE="/apps/apache/tomcat_instances/$2"
CATALINA_PID="${CATALINA_BASE}/work/tomcat.pid"

if [ ! -d $CATALINA_BASE ]; then
    echo "Tomcat instance $CATALINA_BASE doesn't exists."
    exit -1
fi

echo "******************************************************"
echo "* CATALINA_HOME: ${CATALINA_HOME}                     "
echo "* CATALINA_BASE: ${CATALINA_BASE}                     "
echo "* JAVA_HOME: ${JAVA_HOME}                             "
echo "* CATALINA_PID : ${CATALINA_PID}                      "
echo "******************************************************"

export CATALINA_HOME
export CATALINA_BASE
export JAVA_HOME
export CATALINA_PID

if [ $1 == "start" ]; then
    echo " Start tomcat "
    ${CATALINA_HOME}/bin/startup.sh
fi

if [ $1 == "debug" ]; then
    echo " Start tomcat in debug mode on port 8000"
    set JPDA_ADDRESS=8000
    set JPDA_TRANSPORT=dt_socket
    ${CATALINA_HOME}/bin/catalina.sh jpda start
fi


if [ $1 == "stop" ]; then
    echo "Stop tomcat "
    ${CATALINA_HOME}/bin/shutdown.sh
fi

if [ $? -eq 0 ]; then
    echo "[$1] Tomcat instance $2, please check log files at ${CATALINA_BASE}/logs"
else
    echo "[$1] Tomcat instance $2, failed."
fi


