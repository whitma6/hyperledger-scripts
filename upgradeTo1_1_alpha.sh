#!/bin/bash

cd ~

#### Download/update to latest docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.20.0/docker-compose-$(uname -s)-$(uname -m)" > /tmp/docker-compose
sudo mv /tmp/docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
 
#### Confirm that the version shows as 1.18
docker-compose --version
 
#### Download/update to version 1.1 of the docker images
cd ~/fabric-samples
curl -sSL https://goo.gl/6wtTN5 | bash -s 1.1.0

npm install -g composer-cli@next
npm install -g composer-rest-server@next
npm install -g generator-hyperledger-composer@next
npm install -g composer-playground@next

cd ~/fabric-tools
export FABRIC_VERSION=hlfv11
echo 'export FABRIC_VERSION=hlfv11' >> ~/.profile

./downloadFabric.sh
