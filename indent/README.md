indent 1.9.1
============

Description: Unix source code processing utility. This benchmark and its test
inputs are taken from Miller et al.'s work on fuzz testing.

**Bug:** Infinite loop.

Files
-----

README.txt

indent-1.9.1.tar.gz: original indent source code

indent_comb.c: combined source code on which modify operates

indent_comb.c-best.c: a repaired variant (seed=5, mut=0.06,
indent_coverage.c: indent_comb.c instrumented for path information

output.t1:
output.t2:
output.t3:
output.t4:
output.t5:
output.t6:
output.t7: Reference output for test cases

t1:
t2:
t3:
t4:
t5:
t7: input files for tests. "Random" (taken from fuzz testing work). t7 is the
bad test.

test-bad.sh: "bad test" script. Passes t7 to the variant under test and outputs
"t7" to the output file if the program terminates without crashing.

test-good.sh: "good tests" script. Calls variant on 5 other inputs on which
unmodified indent works fine and, if the output matches the reference output,
outputs a line per passed test to the passed in output file.
