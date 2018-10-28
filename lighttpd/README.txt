*****************************
* lighttpd  1.4.17          *
*****************************

Description: A lightweight, multi-threaded web server, optimized for
high-performance environments in use by a number of Real People such as YouTube
and Wikimedia.

Bug: Remote heap buffer overflow in the fastcgi module (speeds up scripting
basically by keeping a persistent instance of the interpreter). Allows a hacker
to remotely escalate priviliges.
http://nvd.nist.gov/nvd.cfm?cvename=CVE-2007-4727 The exploit is in a file
called "hoagie.c", which we got from http://www.milw0rm.com/exploits/4437

Notes:

(0) Requires a 32-bit architecture and the ability to open ports.

(2) test cases: For some reason, we merged the good and bad testcases into one
file; all test cases are therefore weighted equally; test-bad.sh is empty; max
fitness is 3.  Set LDIR in test-good.sh to your lighttpd install directory
(~/lighttpd-1.4.17-root)

(3) Reference test output: one of our test cases tests fastcgi by querying a php
script that calls phpinfo().  Regenerate the reference output by running the
test command (see test-good.sh) against an unmodified version of the webserver
and saving the first 100 lines of the output (head -n 100 output.txt >
hello.php.output).  The hello.php.output in this directory is probably different
from what will be returned on a different machine.

(7) Install fastcgi.  Launch fastcgi before modify. We used this command:

~/lighttpd-1.4.17-root$ bin/spawn-fcgi -f /usr/bin/php-cgi -s the-socket -P ~/lighttpd-1.4.17-root/fastcgi.pid -n &


(8) Webserver configuration: before running lighttpd, modify the lighttpd.conf
in this directory and put it in ~/lighttpd-1.4.17-root/.  Search the file for
pathnames referencing genprog and modify them to point to your installation.  If
you don't like the default port (line 140 in the conf file, server.port = 8080),
change it, but be sure to change it in test-good.sh too.

(9) Webserver document setup: Untar/zip htdocs.tar.gz and put it in
~/lighttpd-1.4.17-root/


(10) Running lighty: you can see how this is done on line 8 of test-good.sh:

$LDIR/sbin/lighttpd -D -f $LDIR/lighttpd.conf -m $LDIR/lib/ &

Make sure it works and try querying the hello.php script and/or index.html
before you launch modify.

(11) hoagie.c exploits the vulnerability. Compile as normal (gcc -o
hoagie hoagie.c) and check out the last couple of lines of
test-good.sh to see how it works. We're don't crash the server;
instead, we use the exploit to remotely escalate access to stuff we
shouldn't (namely /etc/passwd).

(12) The tests require "limit"; 5 seconds should suffice.

Files:
README.txt: this file

fake-gcc.sh: script for compiling variants.

hoagie.c: source code for the vulnerability exploit; if your server is
vulnerable, reads the contents of /etc/passwd

htdocs.tar.gz: htdocs for the server variants. Must be unzipped/untarred and
placed in root install directory.

hello.php.output:
index.html.output: Reference output for positive test cases

lighttpd-1.4.17.tar.gz: lighttpd source code

lighttpd.conf: configuration file, to be placed in the root install directory.

mod_fastcgi.c: Un-preprocessed (original!) mod_fastcgi source code.
