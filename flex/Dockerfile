FROM ubuntu:16.04

# create docker user
RUN apt-get update \
 && apt-get install --no-install-recommends -y sudo \
 && useradd -ms /bin/bash docker \
 && echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
 && adduser docker sudo \
 && apt-get clean \
 && mkdir -p /home/docker \
 && sudo chown -R docker /home/docker \
 && sudo chown -R docker /usr/local/bin \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER docker

# install dependencies
RUN sudo apt-get update \
 && sudo apt-get install -y --no-install-recommends \
    gcc \
    libc6-dev \
    gcovr \
    build-essential \
    bison \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /experiment
COPY . /experiment/
RUN sudo chown -R docker . /tmp \
 && tar -xf flex-2.5.4a.tar.gz \
 && rm flex-2.5.4a.tar.gz \
 && mv flex-2.5.4 source \
 && cd source \
 && ./configure \
 && make -j4
