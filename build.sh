#!/bin/bash
go get github.com/tools/godep
go get -u github.com/MediaMoleculeLtd/ecr-login
go build ./ecr-login.go
version=0.0.1
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo ecr-login.go
docker build -t mediamoleculeltd/ecr-login:${version} .
docker tag mediamoleculeltd/ecr-login:${version} mediamoleculeltd/ecr-login:latest
docker push mediamoleculeltd/ecr-login
