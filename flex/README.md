flex 2.5.4a
===========

Description: Lexical analyzer generator. Benchmark and test inputs taken from
Miller et al.'s work on fuzz testing.

Bug: segmentation fault.

Notes:
(0) modify operates over the cilly-combined source (flex_comb.c); regenerate it
for your machine.

Files:

flex-2.5.4a.tar.gz: original uncombined flex source code.
flex_comb.c: Combined source file; code to which modify is applied.

output.t1:
output.t2:
output.t3:
output.t4:
output.t5: Reference output files.

`inputs/*`: contains an input file for each test, where each input file has
the same name as the test.

`test.sh`: accepts the name of a test to be executed. Produces an exit code of
`0` if the test passed, and a non-zero exit code if the test failed. For the
tests that pass on the original, buggy version of the program (a.k.a. the
positive tests), the test script compares the output of the program for a given
input against an expected output. For the test that fails on the buggy program
(a.k.a. the negative test), the test harness executes the program with a fuzz
input and checks that the execution does not seg. fault. (Note that the
negative test does not perform any checking on the output of the program.)
