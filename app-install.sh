#!/bin/bash

# Function to check for uppercase characters
contains_uppercase() {
    [[ "$1" =~ [A-Z] ]]
}

# Ask the user for name of its github user 
while true; do
    read -p "Name of your github user (example: polangres) :  " GITHUB_USER
    if contains_uppercase "$GITHUB_USER"; then
        echo "The github user name should not contain uppercase characters. Please try again."
    else
        break
    fi
    if [ -z "${GITHUB_USER}" ]
    then
        echo "The github user name should not be empty. Please try again."
    fi
done

# Ask the user if he wants to install the app with podman
while true; do
read -p "Do you want to install the apps with podman, otherwise docker will be used ? (yes/no) : " PODMAN;
# Check if the user answered yes or no
    if [ "${PODMAN}" == "yes" ] || [ "${PODMAN}" == "no" ]; then 
        break
        else
            echo "Please answer by yes or no";
    fi
done

if [ "${PODMAN}" == "yes" ]; then

    # Add user to subuid and subgid if not already present
    add_to_file() {
        local file="$1"
        local entry="$2"
        if ! grep -q "^${entry}$" "$file"; then
            echo "$entry" | sudo tee -a "$file" > /dev/null
            echo "Added $entry to $file"
        else
            echo "$entry already exists in $file"
        fi
    }

    add_to_file "/etc/subuid" "${USER}:100000:65536"
    add_to_file "/etc/subgid" "${USER}:100000:65536"

    # Run commands as root
    sudo bash -c 'echo "net.ipv4.ip_unprivileged_port_start=25" > /etc/sysctl.d/user_priv_ports.conf';

    # Apply the changes
    sudo sysctl --system;

    systemctl --user start podman.socket;
    systemctl --user enable podman.socket;

    # Comment the first line of /usr/share/containers/mounts.conf
    sudo sed -i '1s/^/# /' /usr/share/containers/mounts.conf;
fi


while true; do
read -p "Do you want to install docauposte2 ? (yes/no) : "  ANSWER_DAP;
# Check if the user answered yes or no
    if [ "${ANSWER_DAP}" == "yes" ] || [ "${ANSWER_DAP}" == "no" ]; then 
        break
        else
            echo "Please answer by yes or no";
    fi
done

if [ "${ANSWER_DAP}" == "yes" ]; then
    wget https://raw.githubusercontent.com/${GITHUB_USER}/docauposte2/main/install-docauposte2.sh   && chmod +x install-docauposte2.sh && bash install-docauposte2.sh ${GITHUB_USER} ${PODMAN};
fi


while true; do
read -p "Do you want to install eFNC2 ? (yes/no) : "  ANSWER_EFNC;
# Check if the user answered yes or no
    if [ "${ANSWER_EFNC}" == "yes" ] || [ "${ANSWER_EFNC}" == "no" ]; then 
        break
        else
            echo "Please answer by yes or no";
    fi
done

if [ "${ANSWER_EFNC}" == "yes" ]; then
    wget https://raw.githubusercontent.com/${GITHUB_USER}/eFNC2/main/install-efnc2.sh   && chmod +x install-efnc2.sh && bash install-efnc2.sh ${GITHUB_USER} ${PODMAN};
fi


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
    wget https://raw.githubusercontent.com/${GITHUB_USER}/opsign/main/install-opsign.sh  && chmod +x install-opsign.sh && bash install-opsign.sh ${GITHUB_USER} ${PODMAN};
    else
    echo "opsign not installed";
fi


git clone https://github.com/${GITHUB_USER}/apppo.git;

cd apppo/;

if [ "${PODMAN}" == "yes" ]; then
    envsubst < template.yml > apppo.yml;
    podman play kube apppo.yml;
    else
    docker compose up --build -d;
fi