. /steps-after/env/buildvars-cross
. /steps-after/env/env-x64

mkdir $X64_BUILDROOT/binutils-build
cd $X64_BUILDROOT/binutils-build

../src/binutils-2.41/configure --prefix=/x86_64/usr \
                               --host=$X64_MUSL \
                               --disable-nls \
                               --enable-shared \
                               --enable-gprofng=no \
                               --disable-werror \
                               --enable-64-bit-bfd \
                               --enable-new-dtags \
                               --enable-default-hash-style=gnu \
                               --with-sysroot=/x86_64
make -j${JOBS} && make install