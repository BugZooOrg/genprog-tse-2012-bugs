#!/bin/bash
pushd /experiment/source && \
timeout 20 gcc ./atris_comb.c -o ./atris -lSDL -lpthread -lSDL_ttf -m32 -Wno-attributes $1
