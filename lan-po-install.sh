#!/bin/bash

# This script is used to install the LAN-PO software 
while true; do
read -p "Voulez-vous installer une (autre) application ? (y/n) " ANSWER;
    if [ "${ANSWER}" == "y" ] || [ "${ANSWER}" == "n" ]; then 
        break
        else
            echo "Please answer by yes or no";
    fi
done

if [ "${ANSWER}" == "y" ]; then

while true; do
read -p "Voulez-vous installer DocAuPoste  ? (y/n)" DAP_ANSWER;
    if [ "${DAP_ANSWER}" == "y" ] || [ "${DAP_ANSWER}" == "n" ]; then 
        break
        else
            echo "Please answer by yes or no";
    fi
done

if [ "${DAP_ANSWER}" == "y" ]; then
while true; do
read -p "Source : https://github.com/kiloutyg/docauposte2/blob/main/install-docauposte2.sh ? (y/n) " DAP_SOURCE_ANSWER;
    if [ "${DAP_SOURCE_ANSWER}" == "y" ] || [ "${DAP_SOURCE_ANSWER}" == "n" ]; then 
        break
        else
            echo "Please answer by yes or no";
    fi
done
if 




fi




fi   