FROM alpine:3.17
LABEL maintainer="Andre Sartori <dev@aph.dev.br>"
RUN apk add --no-cache openjdk11-jre curl
WORKDIR /opt
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
RUN tar zxvf apache*.tar.gz && rm apache*.tar.gz
RUN ln -s apache* tomcat
RUN mv ./tomcat/webapps ./tomcat/webapps.bak && mkdir -p ./tomcat/webapps/ROOT
ADD ./tomcat.keystore /opt/tomcat/conf/
ADD ./enableSSL /opt/
RUN sed -i '/<\/Engine>/ r /opt/enableSSL' /opt/tomcat/conf/server.xml
WORKDIR /opt/tomcat
EXPOSE 8080 8443
CMD ["/opt/tomcat/bin/catalina.sh","run"]
