#!/bin/sh
#docker pull nginx:mainline-alpine

openssl dhparam -out scripts/etc/nginx/dhparam.pem 4096

docker build --no-cache -t dockerwest/nginx:mainline .
