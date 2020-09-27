FROM ubuntu:focal

RUN apt-get update -y && apt-get install -y wget unzip build-essential autotools-dev automake
RUN wget https://github.com/tuna/rsync/archive/master.zip && unzip master.zip
RUN cd rsync-master && ./configure && make && make install
RUN apt-get purge build-essential autotools-dev automake -y && rm -rf rsync-master
CMD rsync --daemon --no-detach 
