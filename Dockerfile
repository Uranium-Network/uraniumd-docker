FROM ubuntu:18.04

WORKDIR /
ADD uraniumd ./uraniumd
ADD install_uranium_daemon.sh ./install_uranium_daemon.sh
#EXPOSE 8088

#RUN ./install_uranium_daemon.sh
RUN apt-get update && apt-get upgrade -y
RUN apt-get install curl wget htop screen libssl1.0 libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libdb-dev libdb++-dev libminiupnpc-dev -y
RUN wget https://uranium.network/node/uranium-daemon-linux.tar.gz
RUN tar -xzvf uranium-daemon-linux.tar.gz
RUN mv uraniumd /usr/bin/
RUN rm uranium-daemon-linux.tar.gz
RUN mkdir $HOME/.uranium
RUN echo "rpcuser=uraniumrpc" >> $HOME/.uranium/uranium.conf
RUN echo "rpcpassword=69c863e3356d3dae95df41337"  >> $HOME/.uranium/uranium.conf
RUN echo "rpcallowip=127.0.0.1"  >> $HOME/.uranium/uranium.conf
RUN echo "rpcport=21067"  >> $HOME/.uranium/uranium.conf
RUN echo "listen=1"  >> $HOME/.uranium/uranium.conf
RUN echo "server=1"  >> $HOME/.uranium/uranium.conf
RUN echo "txindex=1"  >> $HOME/.uranium/uranium.conf
RUN echo "staking=1"  >> $HOME/.uranium/uranium.conf
RUN echo "addnode=node1.uranium.network" >> $HOME/.uranium/uranium.conf
#RUN echo "daemon=1" >> $HOME/.uranium/uranium.conf

CMD uraniumd
