FROM ubuntu:22.04
LABEL maintainer="Andre Sartori <andre@aph.dev.br>"
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install --no-install-recommends wget openjdk-8-jre -y && apt clean
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz -P /tmp && \
    tar xf /tmp/apache-tomcat-8.0.53.tar.gz -C /opt && ln -s /opt/apache-tomcat-8.0.53 /opt/tomcat && \
    useradd -d /opt/tomcat -c 'Tomcat user' -m -s /bin/false tomcat && chown -R tomcat: /opt/tomcat && \
    chmod u+x /opt/tomcat/bin/*.sh
WORKDIR /opt/tomcat
EXPOSE 8080 8443
CMD ["/opt/tomcat/bin/catalina.sh","run"]
