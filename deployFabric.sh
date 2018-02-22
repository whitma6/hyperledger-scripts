#!/bin/bash

cd ~
sudo apt install python
npm install -g composer-cli
npm install -g generator-hyperledger-composer
npm install -g composer-rest-server
npm install -g yo
npm install -g composer-playground

sudo apt install unzip
mkdir ~/fabric-tools
cd ~/fabric-tools
curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.zip
unzip fabric-dev-servers.zip

sudo cat << EOF >> /tmp/http-proxy.conf
[Service]
Environment="HTTPS_PROXY=http://proxy.vici.verizon.com:80/"
EOF
sudo mkdir /etc/systemd/system/docker.service.d
sudo mv /tmp/http-proxy.conf /etc/systemd/system/docker.service.d/http-proxy.conf
sudo systemctl daemon-reload
sudo systemctl restart docker

./downloadFabric.sh

cd ~
git clone -b master https://github.com/hyperledger/fabric-samples.git
cd ~/fabric-samples
curl -sSL https://goo.gl/6wtTN5 | bash

export PATH=~/fabric-samples/bin:$PATH
echo 'PATH=~/fabric-samples/bin:$PATH' >> ~/.profile
