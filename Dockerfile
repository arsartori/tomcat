FROM alpine:3.17
LABEL maintainer="Andre Sartori <dev@aph.dev.br>"
RUN apk add --no-cache openjdk17-jre curl
WORKDIR /opt
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.12/bin/apache-tomcat-10.1.12.tar.gz
RUN tar zxvf apache*.tar.gz && rm apache*.tar.gz
RUN ln -s apache* tomcat
RUN mv ./tomcat/webapps ./tomcat/webapps.dist && mkdir -p ./tomcat/webapps
ADD ./conf/tomcat.keystore /opt/tomcat/conf/
ADD ./conf/enableSSL /opt/
RUN sed -i '/<\/Engine>/ r /opt/enableSSL' /opt/tomcat/conf/server.xml
WORKDIR /opt/tomcat
EXPOSE 8080 8443
CMD ["/opt/tomcat/bin/catalina.sh","run"]
