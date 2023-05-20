#!/bin/bash

#membuat image docker dari Dockerfile, dengan nama item-app, dan memiliki tag v1
docker build -t item-app:v1 .
#melihat daftar image di lokal
docker image ls
#mengubah nama image agar sesuai dengan format GitHub Packages
docker tag item-app:v1 docker.pkg.github.com/adityaayatusy/a433-microservices/item-app:v1
#login ke GitHub Packages
docker login docker.pkg.github.com -u adityaayatusy --password-stdin < ~/github_token
#mengunggah image ke GitHub Packages
docker push docker.pkg.github.com/adityaayatusy/a433-microservices/item-app:v1