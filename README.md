# Tomcat 

### Para criar o container Docker, executar o seguinte comando:
	docker build -t tomcat:<versão> --build-arg VERSION=<versão> --build-arg VER=<versão> .

VERSION = Versão completa do Tomcat. Ex.: 8.0.58
VER = Versão base do Tomcat. Ex.: 7, 8, 9, 10

### Para executar digite:
	docker run -d --name tomcat -p 8080:8080 -p 8443:8443 tomcat:<version>  

### Para acessar a console
	http://localhost:8080

	ou https://localhost:8443

### Para publicar uma aplicação 
	docker cp path_to_webapp.war tomcat:/opt/tomcat/webapps
