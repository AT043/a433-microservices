#!/bin/bash

# Membuat Docker image dari Dockerfile dengan nama image "item-app", dan memiliki tag "v1"
docker build --no-cache -t item-app:v1 .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format Docker Hub
docker tag item-app:v1 at043i/item-app:v1

# Login ke Docker Hub via Terminal
cat pass.txt | docker login --username at043i --password-stdin

# Mengunggah image ke Docker Hub
docker push at043i/item-app:v1
