. /steps-after/env/buildvars-cross
. /steps-after/env/env-x64

mkdir $X64_BUILDROOT/musl-build
cd $X64_BUILDROOT/musl-build

../src/musl-1.2.5/configure CC=x86_64-linux-musl-gcc --build=$X64_MUSL \
                                                     --prefix=/x86_64/usr

make -j${JOBS} && make install

ln -s /x86_64/usr/lib /x86_64/lib

mkdir -p /opt/cross/x86_64-linux-musl/include
cd /x86_64/usr/include
for i in *; do
    ln -s /x86_64/usr/include/$i /opt/cross/x86_64-linux-musl/include/$i
done

cd /x86_64/usr/lib
for i in *; do
    ln -s /x86_64/usr/lib/$i /opt/cross/x86_64-linux-musl/lib/$i
done
