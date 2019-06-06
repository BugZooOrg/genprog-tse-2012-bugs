FROM ubuntu:16.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      build-essential \
      bison \
      byacc \
      gcc \
      vim \
      libc6-dev \
      gcovr \
      ftp \
      netcat \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /experiment
ADD wu-ftpd-2.6.0.tar.gz .
ADD ftpcmd.y.patch /tmp
ADD Makefile.in.patch /tmp

RUN mv wu-ftpd-2.6.0 src \
 && cd src \
 && (cd src && patch -p0 < /tmp/ftpcmd.y.patch) \
 && (cd util/privatepw && patch -p0 < /tmp/Makefile.in.patch) \
 && ./configure \
 && make \
 && rm -rf /tmp/*

COPY test-good.sh .
