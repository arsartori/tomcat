# Tomcat 

### Para criar o container Docker, executar o seguinte comando:
	docker build -t tomcat:<versão> --build-arg VERSION=<versão> --build-arg VER=<versão> .

VERSION = Versão completa do Tomcat. Ex.: 8.5.100
VER = Versão base do Tomcat. Ex.: 7, 8, 9, 10

### Para executar digite:
	docker run -d --name tomcat -p 8080:8080 -p 8443:8443 tomcat:<version>  

### Para acessar a console
	http://localhost:8080

### Para publicar uma aplicação manualmente 
	docker cp path_to_webapp.war tomcat:/opt/tomcat/webapps

### Para executar o container com Docker Compose
	Version=8.5.100 docker compose up -d

### Para acessar o gerenciador do Tomcat, criar uma pasta e copiar os arquivos tomcat-users.xml e manager.xml e acessar com o usuário admin e senha admin.
	mkdir -p /opt/docker/tomcat
	cp tomcat-users.xml /opt/docker/tomcat/
	cp manager.xml /opt/docker/tomcat/ 
