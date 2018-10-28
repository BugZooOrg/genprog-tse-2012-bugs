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
    gcc-multilib \
    build-essential \
    gcovr \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /experiment
ADD lighttpd-1.4.17.tar.gz .
ENV LIGHTTPD_INSTALL_DIR /experiment/install
RUN sudo chown -R docker . \
 && mv lighttpd-1.4.17 source \
 && cd source \
 && ./configure --prefix "${LIGHTTPD_INSTALL_DIR}" \
        CFLAGS="-m32" \
        LDFLAGS="-m32" \
 && make install

# build the exploit

# create reference outputs
