. /steps-after/env/buildvars-cross
. /steps-after/env/env-i386

cd $I386_BUILDROOT/src/busybox-1.37.0

make defconfig
LDFLAGS="--static" make -j${JOBS}
cp ./busybox /usr/bin

ln -s /usr/bin/busybox /usr/bin/vi
ln -s /usr/bin/busybox /usr/bin/unzip
