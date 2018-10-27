#!/bin/bash
test_id=$1
here_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
inputs="${here_dir}/inputs"
executable="${here_dir}/uniq"

case $test_id in
  p1) "${executable}" < "${inputs}/p1" &> /dev/null && exit 0;;
  p2) "${executable}" < "${inputs}/p2" &> /dev/null && exit 0;;
  p3) "${executable}" < "${inputs}/p3" &> /dev/null && exit 0;;
  p4) "${executable}" < "${inputs}/p4" &> /dev/null && exit 0;;
  p5) "${executable}" < "${inputs}/p5" &> /dev/null && exit 0;;
  n1) "${executable}" < "${inputs}/n1" &> /dev/null && exit 0;;
esac
exit 1
