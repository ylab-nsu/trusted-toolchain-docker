export LC_ALL=C
export PKG_CONFIG_PATH=/usr/lib/i386-unknown-linux-musl/pkgconfig

echo "/usr/lib/i386-unknown-linux-musl:/usr/lib" > /etc/ld-musl-i386.path

mkdir -p /output
mkdir -p /rootfs-build
cd /rootfs-build

bash -ex /steps-after/download-after-distfiles.sh
bash -ex /steps-after/build-wget.sh
bash -ex /steps-after/build-cpio.sh
bash -ex /steps-after/build-rsync.sh
bash -ex /steps-after/build-unzip.sh
bash -ex /steps-after/build-flock.sh
bash -ex /steps-after/build-rootfs.sh
