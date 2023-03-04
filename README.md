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
docker run -d --name tomcat -p 8080:8080 arsartori/tomcat:<version>
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
docker run -d --name tomcat -p 8080:8080 -v /opt/tomcat/webapps:/opt/tomcat/webapps arsartori/tomcat:<version>
```

## The webapps default
The webapps default is moved to folder webapps.dist. For restore, copy from this folder to webapps.
```
docker exec -i tomcat mv webapps.dist/examples webapps/
```
