# provided by https://github.com/TimaFrolov

cd util-linux-2.40.2

./autogen.sh
./configure --prefix=/usr --disable-liblastlog2
make flock
cp flock /usr/bin/
