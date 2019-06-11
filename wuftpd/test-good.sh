#!/bin/sh
ulimit -t 5
PROG=/experiment/src/bin/ftpd
TEST_DIR=/experiment/tests
PORT=8080

timeout 60 $PROG -s -p $PORT &
PID=$!
sleep 3s

ftp -in localhost $PORT < "${TEST_DIR}/ftp-command-1" >& 1.out
diff 1.out "${TEST_DIR}/ftp-command-1.out" && echo "ftp-1 passed"

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

kill -9 $PID
killall $PROG
killall -9 $PROG
wait

exit 0
