#!/bin/bash
sudo systemctl start docker

#clone the Git repository
git clone https://github.com/chineduanunobi/hello-web.git

#change to the cloned directory
cd hello-web

#build the Docker image
docker build -t hello-image .

#run the Docker container, mapping port 5000
docker run -p 5000:5000 hello-image
