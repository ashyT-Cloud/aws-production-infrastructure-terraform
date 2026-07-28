#!/bin/bash

dnf update -y

dnf install docker -y

systemctl enable docker

systemctl start docker

docker pull ashytcloud/aws-infra-showcase:v1


docker run -d \
  --name aws-infra-showcase \
  --restart unless-stopped \
  -p 80:80 \
  ashytcloud/aws-infra-showcase:v1
