#!/bin/bash
ulimit -c 8
test_id=$1
here_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
inputs="${here_dir}/inputs"
outputs="${here_dir}/outputs"
executable="${here_dir}/source/flex"

case $test_id in
  p1) "${executable}" < "${inputs}/p1" |& diff "${outputs}/p1" - && exit 0;;
  p2) "${executable}" < "${inputs}/p2" |& diff "${outputs}/p2" - && exit 0;;
  p3) "${executable}" < "${inputs}/p3" |& diff "${outputs}/p3" - && exit 0;;
  p4) "${executable}" < "${inputs}/p4" |& diff "${outputs}/p4" - && exit 0;;
  p5) "${executable}" < "${inputs}/p5" |& diff "${outputs}/p5" - && exit 0;;
  n1) "${executable}" < "${inputs}/n1" && exit 0
esac
exit 1
