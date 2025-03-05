. /steps-after/env/buildvars-cross
. /steps-after/env/env-x64

mkdir $X64_BUILDROOT/binutils-boot-build
cd $X64_BUILDROOT/binutils-boot-build

# somehow I386_ELF instead of I386_MUSL makes it build..
../src/binutils-2.41/configure --build=$I386_ELF \
                               --target=$X64_MUSL \
                               --prefix=/opt/cross \
                               --disable-nls \
                               --disable-multilib

make -j${JOBS} && make install
