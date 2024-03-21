#!/bin/bash

wget https://raw.githubusercontent.com/kiloutyg/docauposte2/main/install-docauposte2.sh   && chmod +x install-docauposte2.sh && bash install-docauposte2.sh;

wget https://raw.githubusercontent.com/kiloutyg/efnc/main/install-eFNC2.sh  && chmod +x install-eFNC2.sh && bash install-eFNC2.sh;

<<<<<<< HEAD
wget https://raw.githubusercontent.com/kiloutyg/posign/main/install-posign.sh  && chmod +x install-posign.sh && bash install-posign.sh;
=======
wget https://raw.githubusercontent.com/kiloutyg/posign/main/install-posign.sh   && chmod +x install-posign.sh && bash install-posign.sh;
>>>>>>> 50129cb8ca8989bff3233651c406ee8df613d1ca

git clone https://github.com/kiloutyg/apppo.git;
cd apppo;
docker compose up --build -d;
