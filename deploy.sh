#!/bin/bash
docker pull sh0l4/acada:latest

docker volume rm acada-volume
docker volume create acada-volume
docker network create acada-app

for i in {1..5} 
do 
docker stop acada-webapp$i || true
sudo docker rm acada-webapp$i -f

docker run -d  --name acada-webapp$i -p 800$i:8080 --network acada-app -v acada-volume/usr/local/tomcat/webapps/webapps sh0l4/acada:latest
echo "Deploying webapp$i container done"
done


