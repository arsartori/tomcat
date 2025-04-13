FROM ubuntu:24.04
LABEL maintainer="Andre Sartori <andre@aphtec.com.br>"
ARG VERSION=9.0.100
ENV TZ=America/Sao_Paulo
RUN apt update && apt install --no-install-recommends wget tzdata openjdk-8-jre -y && apt clean
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz -P /tmp && \
    tar xf /tmp/apache-tomcat-${VERSION}.tar.gz -C /opt && ln -s /opt/apache-tomcat-${VERSION} /opt/tomcat && \
    rm /tmp/apache-tomcat-${VERSION}.tar.gz && useradd -d /opt/tomcat -c 'Tomcat user' -m -s /bin/false tomcat && \
    chown -R tomcat: /opt/tomcat/ && chmod u+x /opt/tomcat/bin/*.sh
WORKDIR /opt/tomcat
USER tomcat
EXPOSE 8080 8443
CMD ["/opt/tomcat/bin/catalina.sh","run"]