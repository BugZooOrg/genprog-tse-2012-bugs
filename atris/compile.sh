#!/bin/bash
timeout 20 gcc /experiment/source/atris_comb.c \
  -o /experiment/source/atris \
  -lSDL -lpthread -lSDL_ttf -m32 -Wno-attributes ${1}
