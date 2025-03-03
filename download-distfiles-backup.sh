#!/usr/bin/env bash

mkdir live-bootstrap/distfiles &&
  cd live-bootstrap/distfiles &&
  curl -L -O https://github.com/ylab-nsu/trusted-toolchain-docker/releases/download/0373292/distfiles.tar.gz &&
  (echo "e57dde83cd98eb341c730c8ce9298e564eed020eae92eb0af4fb5b6b2eb2a7d8  distfiles.tar.gz" | sha256sum) &&
  tar -xvf distfiles.tar.gz && rm distfiles.tar.gz &&
  cd .. && ./download-distfiles.sh
