#!/usr/bin/env bash

docker rm buildroot_rootfs || true

./make-docker-cfg.sh &&
  docker build -t buildroot-build . &&
  docker run --name "buildroot_rootfs" buildroot-build &&
  rm -rf ./output &&
  mkdir -p output &&
  docker cp buildroot_rootfs:/output/rootfs.tar ./output/ && true
