#!/bin/bash

# Perintah untuk build Docker image dari berkas Dockerfile dengan nama <username>
docker build -t ghcr.io/at043/karsajobs:latest .

# Perintah untuk login ke GitHub Package Registry
cat ../pass.txt | docker login ghcr.io --username at043 --password-stdin

# Perintah untuk push image ke GitHub Package Registry
docker push ghcr.io/at043/karsajobs:latest
