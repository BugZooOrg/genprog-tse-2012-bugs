#!/bin/bash
executable="/experiment/source/atris"
test_id=$1
timeout=10

here_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
test_dir="$here_dir/tests"

positive()
{
  source "${test_dir}/env.good.sh"
}

negative()
{
  source "${test_dir}/env.bad.sh"
}

execute()
{
  timeout $timeout $1 |& diff "${test_dir}/${test_id}.out" -
}

case $test_id in
  p1) positive; execute "$executable -h";;
  p2) positive; execute $executable;;
  n1) negative; execute $executable;;
esac
exit $?
