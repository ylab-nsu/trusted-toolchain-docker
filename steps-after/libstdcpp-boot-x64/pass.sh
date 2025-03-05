. /steps-after/env/buildvars-cross
. /steps-after/env/env-x64

mkdir $X64_BUILDROOT/libstdcpp-boot-build
cd $X64_BUILDROOT/libstdcpp-boot-build

# again mostly taken from LFS guide
../src/gcc-13.3.0/libstdc++-v3/configure CC=x86_64-linux-musl-gcc \
                                         CXX=x86_64-linux-musl-g++ \
                                         --build=$X64_MUSL \
                                         --host=$X64_MUSL \
                                         --prefix=/opt/cross \
                                         --disable-multilib \
                                         --disable-nls \
                                         --disable-nls \
                                         --disable-libstdcxx-pch \
                                         --disable-libstdcxx-pch \
                                         --with-gxx-include-dir=/opt/cross/x86_64-linux-musl/include/c++/13.3.0

make -j${JOBS} && make install

# LFS guide states this should be done to avoid cross compiling problems
rm -v /opt/cross/lib64/lib{stdc++{,exp,fs},supc++}.la