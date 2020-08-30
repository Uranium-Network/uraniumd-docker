#!/bin/sh

apt-get update
apt-get upgrade -y

# ==================
# NODE INSTALLATION
# ==================


apt-get install libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libdb-dev libdb++-dev libminiupnpc-dev -y

wget https://uranium.network/node/uranium-daemon-linux.tar.gz
tar -xzvf uranium-daemon-linux.tar.gz
mv uraniumd /usr/bin/
rm uranium-daemon-linux.tar.gz

mkdir $HOME/.uranium

echo "rpcuser=uraniumrpc
rpcpassword=69c863e3356d3dae95df41337
rpcallowip=127.0.0.1
rpcport=21067
listen=1
server=1
txindex=1
staking=1
daemon=1" >> $HOME/.uranium/uranium.conf
