#!/bin/bash

cd ~
sudo apt install python
npm install -g composer-cli
npm install -g generator-hyperledger-composer
npm install -g composer-rest-server
npm install -g yo
npm install -g composer-playground

sudo apt install unzip
sudo apt-get install zip
#mkdir ~/fabric-tools
#cd ~/fabric-tools
#curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.zip
#unzip fabric-dev-servers.zip

sudo cat << EOF >> /tmp/http-proxy.conf
[Service]
Environment="HTTPS_PROXY=http://proxy.vici.verizon.com:80/"
EOF
sudo mkdir /etc/systemd/system/docker.service.d
sudo mv /tmp/http-proxy.conf /etc/systemd/system/docker.service.d/http-proxy.conf
sudo systemctl daemon-reload
sudo systemctl restart docker

npm config set proxy http://proxy.vici.verizon.com:80/
npm config set https-proxy http://proxy.vici.verizon.com:80/

cd ~
curl -sSL https://goo.gl/6wtTN5 | bash -s 1.1.0

export PATH=~/fabric-samples/bin:$PATH
echo 'PATH=~/fabric-samples/bin:$PATH' >> ~/.profile

export FABRIC_VERSION=hlfv11
echo 'export FABRIC_VERSION=hlfv11' >> ~/.profile
