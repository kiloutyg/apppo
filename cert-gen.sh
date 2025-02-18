#!/bin/bash
mkdir -p certs/
openssl req -x509 -nodes -newkey rsa:4096 \
  -keyout certs/lan-apps.key -out certs/lan-apps.corp.ponet.pem -days 825 \
  -subj "/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/O=COMPAGNIE PLASTIC OMNIUM SE/CN=lan-apps.corp.ponet" \
  -addext "subjectAltName=DNS:lan-apps,DNS:${HOSTNAME},DNS:${HOSTNAME}.ad.ponet"