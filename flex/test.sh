#!/bin/bash
ulimit -c 8
test_id=$1
here_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
inputs="${here_dir}/inputs"
executable="${here_dir}/flex"

case $test_id in
  p1) "${executable}" < "${inputs}/p1" |& diff output.t1 - && exit 0;;
  p2) "${executable}" < "${inputs}/p2" |& diff output.t2 - && exit 0;;
  p3) "${executable}" < "${inputs}/p3" |& diff output.t3 - && exit 0;;
  p4) "${executable}" < "${inputs}/p4" |& diff output.t4 - && exit 0;;
  p5) "${executable}" < "${inputs}/p5" |& diff output.t5 - && exit 0;;
  n1)
    rm -rf core.*
    "${executable}" < "${inputs}/n1"
    if [ ! -f core.* ] ; then exit 0; fi
esac
exit 1
