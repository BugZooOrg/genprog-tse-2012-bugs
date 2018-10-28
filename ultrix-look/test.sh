#!/bin/bash
ulimit -c 8
test_id=$1
here_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
inputs="${here_dir}/inputs"
executable="${here_dir}/look"

case $test_id in
  p1) "${executable}" < "${inputs}/p1" && exit 0;;
  p2) "${executable}" < "${inputs}/p2" && exit 0;;
  p3) "${executable}" < "${inputs}/p3" && exit 0;;
  p4) "${executable}" < "${inputs}/p4" && exit 0;;
  p5) "${executable}" < "${inputs}/p5" && exit 0;;
  n1) "${executable}" < "${inputs}/n1" && exit 0;;
esac
exit 1
