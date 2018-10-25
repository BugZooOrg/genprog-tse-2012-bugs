#!/bin/bash
ulimit -c 8
test_id=$1
here_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
test_dir="${here_dir}/test"
executable="${here_dir}/flex"

case $test_id in
  p1) "${executable}" < t1 |& diff output.t1 - && exit 0;;
  p2) "${executable}" < t2 |& diff output.t2 - && exit 0;;
  p3) "${executable}" < t3 |& diff output.t3 - && exit 0;;
  p4) "${executable}" < t4 |& diff output.t4 - && exit 0;;
  p5) "${executable}" < t4 |& diff output.t5 - && exit 0;;
  n1)
    rm -rf my.t11 core.*
    ("${executable}" < t11 >& my.t11)
    if [ ! -f core.* ] ; then exit 0; fi
esac
exit 1
