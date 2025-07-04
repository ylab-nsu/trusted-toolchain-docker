# provided by https://github.com/TimaFrolov

cd wget2-2.1.0

autoconf
./configure --with-ssl=openssl prefix=/usr
aclocal
make
make install
ln -s wget2 /usr/bin/wget
# Without this wget wouldn't be able to find CA certificates and therefore would refuse to download https links. 
mkdir -p /usr/etc
printf 'ca_certificate=/etc/ssl/certs/ca-certificates.crt' >/usr/etc/wget2rc
