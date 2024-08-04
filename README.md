# Tomcat 9.0

### Para criar um container Docker, executar o seguinte comando (alterar a versão desejada):
	docker build -t tomcat:9.0.88 --build-arg VERSION=9.0.88 .
### Para executar digite:
	docker run -d --name tomcat -p 8080:8080 -p 8443:8443 tomcat:9.0.88
### Para acessar a console
	http://localhost:8080
### Para publicar uma aplicação manualmente 
	docker cp path_to_webapp.war tomcat:/opt/tomcat/webapps
### Para rodar o container, com Docker Compose, altere a versão do Tomcat dentro do arquivo
	docker compose up -d

## Executar instalando diretamento no host
 
### Criar usuário
	useradd -d /opt/tomcat -c 'Tomcat user' -m -s /bin/false tomcat
### Instalar JRE/OpenJDK e pacotes adicionais
	apt update && apt install --no-install-recommends wget openjdk-8-jre -y && apt clean
### Baixar o pacote do Tomcat e instalar
	wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.88/bin/apache-tomcat-9.0.88.tar.gz -P /tmp && \
	tar xf /tmp/apache-tomcat-9.0.88.tar.gz -C /opt && ln -s /opt/apache-9.0.88 /opt/tomcat && \
	chown -R tomcat: /opt/tomcat && chmod u+x /opt/tomcat/bin/*.sh
### Adicionar o serviço Tomcat
	cp tomcat.service /etc/systemd/system/ && systemctl daemon-reload && \
	systemctl enable tomcat
