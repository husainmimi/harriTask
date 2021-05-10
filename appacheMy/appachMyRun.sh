#!/bin/sh


containerName="appacheMy"
imageName="appachemy"
dockerFile="appacheMy/Dockerfile"
########################## build a httpd container and name it appachemy
########################## from httpd

docker build . -f $dockerFile -t $imageName
docker run -dit -p 8080:8090  --name=$containerName $imageName 


