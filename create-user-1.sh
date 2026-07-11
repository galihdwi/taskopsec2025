#!/bin/bash

for i in $(seq 1 1300)
do
    username="sevima-adm$i"
    password="w3bsite#$i"

    useradd -m -s /bin/bash $username
    echo "$username:$password" | chpasswd
    usermod -aG sudo $username

    mkdir -p /home/$username/.ssh
    touch /home/$username/.ssh/authorized_keys

    chmod 700 /home/$username/.ssh
    chmod 600 /home/$username/.ssh/authorized_keys

    chown -R $username:$username /home/$username/.ssh

done