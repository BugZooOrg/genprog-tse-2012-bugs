FROM ubuntu:16.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      build-essential \
      bison \
      byacc \
      gcc \
      patch \
      vim \
      libc6-dev \
      gcovr \
      ftp \
      netcat \
      psmisc \
      man \
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
 && mkdir -p /usr/man/man1 \
 && mkdir -p /usr/man/man5 \
 && mkdir -p /usr/man/man8 \
 && ./configure --enable-anonymous --enable-crackers \
 && make \
 && make all \
 && rm -rf /tmp/*

COPY test-good.sh .
COPY tests /experiment/tests

RUN mkdir /var/ftp \
 && useradd -d /var/ftp -s /dev/null ftp \
 && addgroup ftp ftp
