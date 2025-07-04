# provided by https://github.com/TimaFrolov

cd buildroot-2024.11.1

ulimit -n 16777216 ## patch goes funny without this
patch -Np1 -i /patches/buildroot-patches/gcc-target.patch
patch -Np1 -i /patches/buildroot-patches/glibc-target-locale.patch

export FORCE_UNSAFE_CONFIGURE=1
export HOST_CFLAGS="-march=i686"
export HOST_LDFLAGS=-latomic

cp /buildroot.config .config

make

cp output/images/rootfs.tar /output
