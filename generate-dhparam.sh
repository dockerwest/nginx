#!/usr/bin/env sh

openssl dhparam -out mainline/scripts/etc/nginx/dhparam.pem 4096
openssl dhparam -out stable/scripts/etc/nginx/dhparam.pem 4096
