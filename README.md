# How to generate Tomcat Docker images 

## Download from Docker Repository
```
docker pull arsartori/docker-tomcat:<version>
```

## Clone repository
```
git clone https://github.com/arsartori/docker-tomcat.git
```

## Change to directory version and build image
```
cd docker-tomcat/9
docker build -t tomcat9 .
```
