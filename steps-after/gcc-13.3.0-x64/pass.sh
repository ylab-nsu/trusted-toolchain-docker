. /steps-after/env/buildvars-cross
. /steps-after/env/env-x64

mkdir $X64_BUILDROOT/gcc-build
cd $X64_BUILDROOT/gcc-build

cp -r ../src/mpfr-4.1.0 ../src/gcc-13.3.0/mpfr
cp -r ../src/gmp-6.2.1 ../src/gcc-13.3.0/gmp
cp -r ../src/mpc-1.2.1 ../src/gcc-13.3.0/mpc

sed '/thread_header =/s/@.*@/gthr-posix.h/' -i ../src/gcc-13.3.0/libgcc/Makefile.in ../src/gcc-13.3.0/libstdc++-v3/include/Makefile.in

../src/gcc-13.3.0/configure LDFLAGS="-L/opt/cross/lib64" \
                            --build=$X64_MUSL \
                            --host=$X64_MUSL \
                            --target=$X64_MUSL \
                            LDFLAGS_FOR_TARGET=-L$PWD/$X64_MUSL/libgcc \
                            --enable-default-pie \
                            --enable-default-ssp \
                            --disable-nls \
                            --disable-multilib \
                            --disable-libsanitizer \
                            --disable-libssp \
                            --disable-libvtv \
                            --prefix=/x86_64/usr \
                            --with-sysroot=/x86_64 \
                            --enable-languages=c,c++

make -j${JOBS} && make install

ln -sv gcc /x86_64/usr/bin/cc
echo "/x86_64/lib:/x86_64/usr/lib:/x86_64/usr/lib64" > /etc/ld-musl-x86_64.path