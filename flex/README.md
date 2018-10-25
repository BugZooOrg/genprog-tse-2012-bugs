flex 2.5.4a
===========

Lexical analyzer generator. Benchmark and test inputs taken from
Miller et al.'s work on fuzz testing.

**Bug:** segmentation fault.

Files
-----

* `flex-2.5.4a.tar.gz`: an archive containing the original, unmodified source
  code for the faulty program.
* `outputs/*`: contains a reference output file that describes the expected
  output for each test (except for the failing test).
* `inputs/*`: contains an input file for each test, where each input file has
  the same name as the test.
* `test.sh`: accepts the name of a test to be executed. Produces an exit code of
  `0` if the test passed, and a non-zero exit code if the test failed. For the
  tests that pass on the original, buggy version of the program (a.k.a. the
  positive tests), the test script compares the output of the program for a given
  input against an expected output. For the test that fails on the buggy program
  (a.k.a. the negative test), the test harness executes the program with a fuzz
  input and checks that the execution does not seg. fault. (Note that the
  negative test does not perform any checking on the output of the program.)
