#!/bin/bash
set -e
docker stop WEB
docker rm WEB
docker rmi dddbook_web:latest
docker build -t dddbook_web .
docker run -d -p 8080:80 --name WEB dddbook_web
