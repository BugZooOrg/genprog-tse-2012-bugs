#!/bin/bash
test_id=$1
here_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
test_dir="${here_dir}/test"
executable="${here_dir}/source/uniq"

case $test_id in
  p1)
    "${executable}" < t1 &> /dev/null && exit 0;;
  p2)
    "${executable}" < t2 &> /dev/null && exit 0;;
  p3)
    "${executable}" < t4 &> /dev/null && exit 0;;
  p4)
    "${executable}" < tp1 &> /dev/null && exit 0;;
  p5)
    "${executable}" < tp2 &> /dev/null && exit 0;;
  n1)
    "${executable}" < t5 &> /dev/null && exit 0;;
esac
exit 1
