# hyperledger-scripts


Instructions to download and setup a secondary peer config:
cd ~/fabric-samples/

git clone https://github.com/varun-raj/fabric-dev-servers-multipeer.git

cd fabric-dev-servers-multipeer

rm -r composer/crypto-config
rm composer/composer-channel.tx
rm composer/composer-genesis.block


<<copy crypto, genesis, and channel block files>>

<<update startFabric-Peer2.sh (update peer# & orderer IP)>>

<<Update docker-compose-peer3.yml (add cli, update peer#)>>

./startFabric-Peer2.sh


Miscellaneous Docker commands:

Copy a file out of a docker container:
docker cp cli:/opt/gopath/src/github.com/hyperledger/fabric/peer/marbles2.pak ~/marbles2.pak

Cleanup Docker orphans:
docker-compose -f ./composer/docker-compose.yml kill && docker-compose -f ./composer/docker-compose.yml down --remove-orphans
