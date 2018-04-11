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
RUN sudo dpkg --add-architecture i386 \
 && sudo apt-get update \
 && sudo apt-get install -y --no-install-recommends \
      gcc-multilib \
      libsdl1.2-dev:i386 \
      libc6-dev:i386 \
      libsdl-ttf2.0-dev:i386 \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /experiment
ADD compile.sh /experiment
ADD atris_comb.c /experiment/source/
ADD test.sh /experiment
ADD tests /experiment/tests
RUN sudo chown -R docker /experiment

# generate the expected outputs for the positive test case
RUN ./compile.sh \
 && (/bin/bash -c "source tests/env.good.sh && source/atris -h &> tests/p1.out" | exit 0) \
 && rm source/atris

# && (/bin/bash -c "source tests/env.good.sh && source/atris &> tests/p2.out" | exit 0) \
