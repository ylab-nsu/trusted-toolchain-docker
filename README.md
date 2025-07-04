## Init
 
1. Run ``git submodule update --init --recursive``
2. Acquire distfiles by ``./download-distfiles-backup.sh``

## Build script

Run ``./build.sh`` (might need `sudo` for docker deamon access on your system)

Built `rootfs.tar` will be in `./output` dir

## Or build semi-manually

1. Run ``./make-docker-cfg.sh``
2. Run ``docker build -t buildroot-build .``
3. Run built image in container by ``docker run --name "buildroot_rootfs" buildroot-build``

Built `rootfs.tar` will be in container's `/output` and can be extracted by ``docker cp buildroot_rootfs:/output/rootfs.tar .``

