## Build and run

0. Run ``git submodule update --init --recursive``
1. Acquire distfiles by ``./download-distfiles-backup.sh``
2. Run ``./make-docker-cfg.sh``
3. Run ``docker build -t live-bootstrap .``
4. Run built image in container by ``docker run -it live-bootstrap /bin/bash``
