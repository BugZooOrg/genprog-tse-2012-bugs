#!/bin/bash
test_id=$1
here_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
test_dir="${here_dir}/test"
executable="${here_dir}/uniq"

case $test_id in
  p1) "${executable}" < p1 &> /dev/null && exit 0;;
  p2) "${executable}" < p2 &> /dev/null && exit 0;;
  p3) "${executable}" < p3 &> /dev/null && exit 0;;
  p4) "${executable}" < p4 &> /dev/null && exit 0;;
  p5) "${executable}" < p5 &> /dev/null && exit 0;;
  n1) "${executable}" < n1 &> /dev/null && exit 0;;
esac
exit 1
