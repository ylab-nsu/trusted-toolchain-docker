. /steps-after/env/buildvars-cross
. /steps-after/env/env-x64

mkdir $X64_BUILDROOT/gcc-boot-build
cd $X64_BUILDROOT/gcc-boot-build

# basically config from LFS
../src/gcc-13.3.0/configure --build=$I386_MUSL \
                            --target=$X64_MUSL \
                            --prefix=/opt/cross \
                            --with-newlib \
                            --without-headers \
                            --disable-nls \
                            --disable-shared \
                            --disable-multilib \
                            --disable-threads \
                            --disable-libatomic \
                            --disable-libgomp \
                            --disable-libquadmath \
                            --disable-libssp \
                            --disable-libvtv \
                            --disable-libstdcxx \
                            --enable-languages=c,c++

make -j${JOBS} && make install
