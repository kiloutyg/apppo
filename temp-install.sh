#!/bin/bash

wget https://raw.githubusercontent.com/kiloutyg/docauposte2/main/install-docauposte2.sh -O /tmp/install-docauposte2.sh && chmod +x /tmp/install-docauposte2.sh && bash /tmp/install-docauposte2.sh;

wget https://raw.githubusercontent.com/kiloutyg/docauposte2/main/install-eFNC2.sh -O /tmp/install-eFNC2.sh && chmod +x /tmp/install-eFNC2.sh && bash /tmp/install-eFNC2.sh;

git clone https://github.com/kiloutyg/apppo.git;
cd apppo;
docker compose up --build -d;