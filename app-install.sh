#!/bin/bash

while true; do
read -p "Do you want to install the app with podman ? (yes/no) : "  ANSWER;
# Check if the user answered yes or no
    if [ "${PODMAN}" == "yes" ] || [ "${PODMAN}" == "no" ]; then 
        break
        else
            echo "Please answer by yes or no";
    fi
done

if [ "${PODMAN}" == "yes" ]; then
    # Add user to subuid and subgid
    sudo sed -i "$ a\\${USER}:100000:65536" /etc/subuid;
    sudo sed -i "$ a\\${USER}:100000:65536" /etc/subgid;
    # Run commands as root
    sudo bash -c 'echo "net.ipv4.ip_unprivileged_port_start=80" > /etc/sysctl.d/user_priv_ports.conf';

    # Apply the changes
    sudo sysctl --system;

    systemctl --user start podman.socket;
    systemctl --user enable podman.socket;

    # Comment the first line of /usr/share/containers/mounts.conf
    sudo sed -i '1s/^/# /' /usr/share/containers/mounts.conf;
fi


wget https://raw.githubusercontent.com/kiloutyg/docauposte2/main/install-docauposte2.sh   && chmod +x install-docauposte2.sh && bash install-docauposte2.sh;

wget https://raw.githubusercontent.com/kiloutyg/efnc/main/install-eFNC2.sh  && chmod +x install-eFNC2.sh && bash install-eFNC2.sh;

while true; do
read -p "Do you want to install opsign ? (yes/no) : "  ANSWER;
# Check if the user answered yes or no
    if [ "${ANSWER}" == "yes" ] || [ "${ANSWER}" == "no" ]; then 
        break
        else
            echo "Please answer by yes or no";
    fi
done

if [ "${ANSWER}" == "yes" ]; then
    wget https://raw.githubusercontent.com/kiloutyg/opsign/main/install-opsign.sh  && chmod +x install-opsign.sh && bash install-opsign.sh;
    else
    echo "opsign not installed";
fi


git clone https://github.com/kiloutyg/apppo.git;
cd apppo;
sudo chmod 777 ./html -R;
docker compose up --build -d;
