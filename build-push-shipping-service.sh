#!/bin/bash

# Membuat Docker image dari Dockerfile dengan nama image "item-app", dan memiliki tag "v1"
docker build -t dapp-shipping-service:latest .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format Docker Hub
docker tag dapp-shipping-service:latest ghcr.io/at043/dapp-shipping-service:latest

# Perintah untuk login ke GitHub Package Registry
cat ../pass.txt | docker login ghcr.io --username at043 --password-stdin

# Perintah untuk push image ke GitHub Package Registry
docker push ghcr.io/at043/dapp-shipping-service:latest
