#!/bin/bash
openssl req -x509 -nodes -newkey rsa:4096 \
  -keyout certs/lan-apps.key -out certs/lan-apps.crt -days 825 \
  -subj "/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/O=COMPAGNIE PLASTIC OMNIUM SE/CN=lan-apps" \
  -addext "subjectAltName=DNS:sanclp0031,DNS:sanclp0031.corp.ponet,DNS:sanclp0031.ad.ponet"