#FROM goodrain.me/rainbond-ant
FROM guligo/jdk-maven-ant-tomcat
WORKDIR /app

ENV TEST youknowit
COPY . ./

RUN ant -buildfile ./build.xml

RUN mv /app/dist/*.war ${TOMCAT_HOME}/webapps/ROOT.war

RUN rm -rf ${TOMCAT_HOME}/webapps/ROOT

EXPOSE 8080
