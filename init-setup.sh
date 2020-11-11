#!/bin/bash

FILE=/etc/init-setup
if [ ! -f "$FILE" ];then
    echo "0" > /etc/init-setup
fi

exec=$(cat /etc/init-setup)

if [ $exec -eq 0 ]; then
    exit 0
    apt-get update -y
    apt-get install ansible -y
    apt-get install git -y
    apt-get install wget -y

    wget https://storage.googleapis.com/endpoints-key/keys.tar.gz -P /root
    tar -xzvf keys.tar.gz

    echo "[local]" >> /etc/ansible/hosts
    echo "localhost" >> /etc/ansible/hosts

    ssh-keyscan github.com >> ~/.ssh/known_hosts
    echo "1" > /etc/init-setup

fi

exit 0
