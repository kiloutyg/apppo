#!/bin/bash

sudo dnf install -y cifs-utils

echo "This script allow the use of a cifs file server to transfer certificate.
 It will automatically update the reverse proxy tls certificates.
 The certificate must be named : <domain_name>.corp.ponet.pem
 While the key must be named : <domain_name>.key"

mkdir -p tmp

while true; do

    while true; do
        while true; do
            read -p "What is the address of the cifs directory to use ?
            Please, do use the exact certificates directory.
            (Use this format: //server_name/path/to/directory ) : " SERVER_ADDRESS
            if [ -z "${SERVER_ADDRESS}" ]
            then
                echo "The server address should not be empty. Please try again."
            else
                break
            fi
        done

        while true; do
            read -p "You will need to user an admin account to connect to the file server,
            what is your admin account username (e.g.: admin.hpotter) : " ADMIN_USER_NAME
            if [ -z "${ADMIN_USER_NAME}" ]
            then
                echo "The admin account username should not be empty. Please try again."
            else
                break
            fi
        done

        sudo mount -t cifs ${SERVER_ADDRESS} tmp/ -o username=${ADMIN_USER_NAME}

        if [ "$( ls -A 'tmp/' )" ]; 
        then
            echo "Directory mounted correctly"
        else
            echo "The temporary folder is empty, did you make a mistake ? 
            Here are the value you entered : "
            echo ${SERVER_ADDRESS}
            echo ${ADMIN_USER_ADMIN}
        fi

        cp -v tmp/* certs/

        if [ -z "$( ls -A 'certs/' )" ]; then
            echo "No files got copied, try again"
        else
            echo "Files got copied"
            break
        fi
    done

    

    ls -la certs/
    read -p " Are those files the ones you intended to copy ? (yes/no) " yn

    case $yn in 
        [Yy]* ) echo ok, we will proceed;
            break;;
        [Nn]* ) echo you will need to restart from the beginning;
            exit;;
        * ) echo invalid response;;
    esac


done


sudo umount tmp

rm -r tmp

touch dynamic.yml