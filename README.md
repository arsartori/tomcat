# How to generate Tomcat Docker images 

## Clone repository
```
git clone https://github.com/arsartori/docker-tomcat.git
```

## Change to directory version and build image
```
cd docker-tomcat/<version>
docker build -t tomcat .  

Version 7.0 have three versions: Alpine, Ubuntu and Debian.  
To run build command, rename Dockerfile
```

## How to run it

```
Without SSL  
docker run -d --name tomcat -p 8080:8080 arsartori/tomcat:<version>  

With SSL  
docker run -d --name tomcat -p 8080:8080 -p 8443:8443 arsartori/tomcat:<version>
```

## To access

```
http://localhost:8080 or https://localhost:8443
```

## Publish webapp

```
docker cp path_to_webapp.war tomcat:/opt/tomcat/webapps
```

## Enable ROOT webapps

```
docker exec -i tomcat cp -r webapps.bak/ROOT /opt/tomcat/webapps
```

## Use local folder with volume

```
mkdir -p /opt/tomcat/webapps
docker run -d --name tomcat -p 8080:8080 -p 8443:8443 -v /opt/tomcat/webapps:/opt/tomcat/webapps arsartori/tomcat:<version>
```

## Restore all webapps default
The webapps default is moved to folder webapps.bak. For restore, copy from this folder to webapps.
```
docker exec -i tomcat mv webapps.dist/examples webapps/
```
