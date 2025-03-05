## Build and run

1. Acquire distfiles by ``./download-distfiles-backup.sh``
2. Run ``./make-docker-cfg.sh`` or ``jobs=N ./make-docker-cfg.sh`` for using more jobs while building
3. Run ``docker build -t trusted-toolchain .``
4. Run built image in container by ``docker run -it trusted-toolchain /bin/bash``
