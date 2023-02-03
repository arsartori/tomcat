# Docker image Tomcat
Last vesion 7.0.109

## How to run it

```
docker run -d --name tomcat -p 8080:8080 arsartori/tomcat:7.0.109
```

## To access

```
http://localhost:8080
```

## Upload webapp

```
docker cp path_to_webapp.war tomcat:/opt/tomcat/webapps
```

## Use local folder with volume

```
mkdir -p /opt/tomcat/webapps
docker run -d --name tomcat -p 8080:8080 -v /opt/tomcat/webapps:/opt/tomcat/webapps arsartori/tomcat:7.0.109
```

## The webapps default
The webapps default is moved to folder webapps.dist. For restore, copy from this folder to webapps.
```
docker exec -i tomcat mv webapps.dist/examples webapps/
```
