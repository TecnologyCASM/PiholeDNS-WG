#!/bin/bash

# Presequisitos para instalar docker:
sudo apt-get update &&
     sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common \
     vim \
     fail2ban \
     ntfs-3g

# Instalar firmas GPG del repo de Docker:
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
     sudo apt-key fingerprint 0EBFCD88
    
# Agregar repo de Docker:
echo "deb [arch=armhf] https://download.docker.com/linux/debian \
     $(lsb_release -cs) stable" | \
     sudo tee /etc/apt/sources.list.d/docker.list

# Instalar Docker:
sudo apt-get update && 
     sudo apt-get install -y docker-ce docker-compose

# Agregar usuario al grupo docker y desloguearse y volverse a loguear:
sudo usermod -aG docker ${USER}

# TecnologyCASM/PiHoleUnbound
git clone https://github.com/TecnologyCASM/PiHoleUnbound-WG.git &&
       cd PiHoleUnbound-WG && docker compose up -d &&
       docker ps
       
