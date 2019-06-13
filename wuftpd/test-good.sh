#!/bin/bash
ulimit -t 5
PROG=/experiment/src/bin/ftpd
TEST_DIR=/experiment/tests
PORT=8080
TEST=$1
PASSED=0

# launch the server
timeout 60 $PROG -s -p $PORT &
PID=$!
sleep 3s

# execute the test
case $TEST in
  p1) ftp -v -in localhost $PORT < "${TEST_DIR}/ftp-command-1" |& tail -n+3;;
  p2) ftp -v -in localhost $PORT < "${TEST_DIR}/ftp-command-2" |& tail -n+3;;
  p3) ftp -v -in localhost $PORT < "${TEST_DIR}/ftp-command-3" |& tail -n+3;;
  *)  echo "ERROR: unknown test ($1)"
esac

# ftp -in localhost $PORT < "${TEST_DIR}/ftp-command-2" >& 2.out
# diff 2.out "${TEST_DIR}/ftp-command-2.out" && echo "ftp-2 passed"
# diff passwd /etc/passwd && echo "passwd"
# 
# ftp -in localhost $PORT < "${TEST_DIR}/ftp-command-3" \
#   |& diff - "${TEST_DIR}/ftp-command-3.out" && echo "ftp-3"
# diff dmesg /bin/dmesg && echo "dmesg"
# 
# nc localhost $PORT < "${TEST_DIR}/nc-command-4" | grep -v 220 | grep -v Total | grep -v 200- \
#   &| diff - "${TEST_DIR}/nc-command-4.out" && echo "nc-4"
# 
# nc localhost $PORT < "${TEST_DIR}/nc-command-5" | grep -v 220 >& 5.out
# diff 5.out "${TEST_DIR}/nc-command-5.out" && echo "nc-5"

# ensure the server is killed
kill -9 $PID &> /dev/null
killall $PROG &> /dev/null
killall -9 $PROG &> /dev/null
wait

# report the result
exit $PASSED
