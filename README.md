# Tomcat 9

### Para criar um container Docker, executar o seguinte comando (alterar a versão desejada):
	docker build -t tomcat:9.0.90 --build-arg VERSION=9.0.90 .
### Para executar digite:
	docker run -d --name tomcat -p 8080:8080 -p 8443:8443 tomcat:9.0.90
### Para acessar a console
	http://localhost:8080
### Para publicar uma aplicação manualmente 
	docker cp path_to_webapp.war tomcat:/opt/tomcat/webapps
### Para executar o container com Docker Compose

Editar o arquivo docker-compose.yaml e alterar a versão da imagem. Após alterar, executar:

	docker compose up -d

## Executar instalando diretamento no host
 
### Criar usuário
	useradd -d /opt/tomcat -c 'Tomcat user' -m -s /bin/false tomcat
### Instalar JRE/OpenJDK e pacotes adicionais
	apt update && apt install --no-install-recommends wget openjdk-8-jre -y && apt clean
### Baixar o pacote do Tomcat e instalar
	wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.7/bin/apache-tomcat-10.1.7.tar.gz -P /tmp && \
	tar xf /tmp/apache-tomcat-10.1.7.tar.gz -C /opt && ln -s /opt/apache-tomcat-10.1.7 /opt/tomcat && \
	chown -R tomcat: /opt/tomcat && chmod u+x /opt/tomcat/bin/*.sh
### Adicionar o serviço Tomcat
	cp tomcat.service /etc/systemd/system/ && systemctl daemon-reload && \
	systemctl enable tomcat
