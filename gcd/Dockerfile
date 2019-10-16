FROM ubuntu:16.04

# create docker user
RUN apt-get update \
 && apt-get install --no-install-recommends -y sudo patch \
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
RUN sudo dpkg --add-architecture i386 \
 && sudo apt-get update \
 && sudo apt-get install -y --no-install-recommends \
      gcc \
      gcovr \
      libc6-dev \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /experiment
ADD gcd.c /experiment/source/
ADD test.sh /experiment
ADD test /experiment/test
RUN sudo chown -R docker /experiment
