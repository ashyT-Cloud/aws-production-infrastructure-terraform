#!/bin/bash

dnf update -y

dnf install docker -y

systemctl enable docker

systemctl start docker

usermod -aG docker ec2-user

docker run -d \
  --name web \
  -p 80:80 \
  nginx
