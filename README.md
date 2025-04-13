# Tomcat

### Para executar digite:
	docker run -d --name tomcat -p 8080:8080 arsartori/tomcat:latest
### Para acessar a console
	http://localhost:8080
### Para publicar uma aplicação
	docker cp path_to_webapp.war tomcat:/opt/tomcat/webapps
### Para rodar o container, com Docker Compose, altere a versão do Tomcat dentro do arquivo
	docker compose up -d