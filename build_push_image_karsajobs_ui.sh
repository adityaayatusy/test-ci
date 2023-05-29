#!/bin/bash

#membuat image docker dari Dockerfile dengan nama karsajobs-ui, dan memiliki tag latest
docker build -t karsajobs-ui:latest .
#melihat daftar image di lokal
docker image ls
#mengubah nama image agar sesuai dengan format GitHub Packages
docker tag karsajobs-ui:latest docker.pkg.github.com/adityaayatusy/a433-microservices/karsajobs-ui:latest
#login ke GitHub Packages
docker login docker.pkg.github.com -u adityaayatusy --password-stdin < ~/github_token
#mengunggah image ke GitHub Packages
docker push docker.pkg.github.com/adityaayatusy/a433-microservices/karsajobs-ui:latest
