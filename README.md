# Tomcat 8.5.100

## 1) Executar na forma de Docker container

### Para criar o container Docker, executar o seguinte comando:
	docker build -t tomcat:8.5.100 .

### Para executar digite:
	docker run -d --name tomcat -p 8080:8080 -p 8443:8443 tomcat:8.5.100  

### Para acessar a console
	http://localhost:8080

### Para publicar uma aplicação manualmente 
	docker cp path_to_webapp.war tomcat:/opt/tomcat/webapps

### Para executar o container com Docker Compose
	docker compose up -d

### Para acessar o gerenciador do Tomcat, criar uma pasta e copiar os arquivos tomcat-users.xml e manager.xml e acessar com o usuário admin e senha admin.
	mkdir -p /opt/docker/tomcat
	cp tomcat-users.xml /opt/docker/tomcat/
	cp manager.xml /opt/docker/tomcat/

## 2) Executar instalando diretamento no host
 
### Criar usuário
	useradd -d /opt/tomcat -c 'Tomcat user' -m -s /bin/false tomcat
### Instalar JRE/OpenJDK e pacotes adicionais
	apt update && apt install --no-install-recommends wget openjdk-8-jre -y && apt clean
### Baixar o pacote do Tomcat e instalar
	wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz -P /tmp && \
	tar xf /tmp/apache-tomcat-8.5.100.tar.gz -C /opt && ln -s /opt/apache-tomcat-8.5.100 /opt/tomcat && \
	chown -R tomcat: /opt/tomcat && chmod u+x /opt/tomcat/bin/*.sh
### Adicionar o serviço Tomcat
	cp tomcat.service /etc/systemd/system/ && systemctl daemon-reload && \
	systemctl enable tomcat
