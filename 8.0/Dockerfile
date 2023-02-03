FROM alpine:3.16
LABEL maintainer="Andre Sartori <aph@aph.dev.br>"
RUN apk add --no-cache openjdk8-jre curl
WORKDIR /opt
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz
RUN tar zxvf apache*.tar.gz && rm apache*.tar.gz
RUN ln -s apache* tomcat
RUN mv ./tomcat/webapps ./tomcat/webapps.bak && mkdir -p ./tomcat/webapps/ROOT
WORKDIR /opt/tomcat
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh","run"]
