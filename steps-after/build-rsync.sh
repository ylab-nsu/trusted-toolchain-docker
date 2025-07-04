# provided by https://github.com/TimaFrolov

cd rsync-3.4.0

autoconf
./configure --disable-xxhash --disable-lz4 --disable-zstd # since they are not installed
make && make install
