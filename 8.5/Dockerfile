FROM alpine:3.16
LABEL maintainer="Andre Sartori <dev@aph.dev.br>"
RUN apk add --no-cache openjdk8-jre curl
WORKDIR /opt
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.83/bin/apache-tomcat-8.5.83.tar.gz
RUN tar zxvf apache*.tar.gz && rm apache*.tar.gz
RUN ln -s apache* tomcat
RUN mv ./tomcat/webapps ./tomcat/webapps.bak && mkdir -p ./tomcat/webapps/ROOT
ADD ./tomcat.keystore /opt/tomcat/conf/
ADD ./enableSSL /opt/
RUN sed -i '/<\/Engine>/ r /opt/enableSSL' /opt/tomcat/conf/server.xml
WORKDIR /opt/tomcat
EXPOSE 8080 8443
CMD ["/opt/tomcat/bin/catalina.sh","run"]
