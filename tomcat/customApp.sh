#Put this file in the /etc/profile.d


#Setup Java Environment
export JAVA_HOME=/apps/java/current
export PATH=${JAVA_HOME}/bin:${PATH}

#Create Alias commands
alias tomcat-service="/apps/apache/tomcat/bin/tomcat-service.sh"
