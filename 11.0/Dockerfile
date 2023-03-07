FROM alpine:3.17
LABEL maintainer="Andre Sartori <dev@aph.dev.br>"
RUN apk add --no-cache openjdk17-jre curl
WORKDIR /opt
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-11/v11.0.0-M4/bin/apache-tomcat-11.0.0-M4.tar.gz
RUN tar zxvf apache*.tar.gz && rm apache*.tar.gz
RUN ln -s apache* tomcat
RUN mv ./tomcat/webapps ./tomcat/webapps.bak && mkdir -p ./tomcat/webapps/ROOT
ADD ./tomcat.keystore /opt/tomcat/conf/
ADD ./enableSSL /opt/
RUN sed -i '/<\/Engine>/ r /opt/enableSSL' /opt/tomcat/conf/server.xml
WORKDIR /opt/tomcat
EXPOSE 8080 8443
CMD ["/opt/tomcat/bin/catalina.sh","run"]
