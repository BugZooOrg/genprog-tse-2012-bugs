export DIR=/experiment/source
export LDIR=/experiment/install/lib
pushd "${DIR}/src"
rm -rf mod_fastcgi.I? .libs/mod_fastcgi.so .libs/mod/fast_cgi.o
make
if [ -f .libs/mod_fastcgi.so -a -f mod_fastcgi.la ]; then
  cp .libs/mod_fastcgi.so mod_fastcgi.la "${LDIR}"
  exit 0
else
  exit 1
fi
