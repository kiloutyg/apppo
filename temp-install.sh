#!/bin/bash

wget https://raw.githubusercontent.com/kiloutyg/docauposte2/main/install-docauposte2.sh   && chmod +x install-docauposte2.sh && bash install-docauposte2.sh;

wget https://raw.githubusercontent.com/kiloutyg/efnc/main/install-eFNC2.sh  && chmod +x install-eFNC2.sh && bash install-eFNC2.sh;

while true; do
read -p "Do you want to install posign ? (yes/no)" 
# Check if the user answered yes or no
    if [ "${ANSWER}" == "yes" ] || [ "${ANSWER}" == "no" ]; then 
        break
        else
            echo "Please answer by yes or no";
    fi
done

if [ "${ANSWER}" == "yes" ]; then
    wget https://raw.githubusercontent.com/kiloutyg/posign/main/install-posign.sh  && chmod +x install-posign.sh && bash install-posign.sh;
    else
    echo "posign not installed";
fi


git clone https://github.com/kiloutyg/apppo.git;
cd apppo;
docker compose up --build -d;
