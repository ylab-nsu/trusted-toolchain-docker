#!/usr/bin/env bash

./make-docker-cfg.sh &&
  docker build -t buildroot-build . &&
  docker run --name "buildroot_rootfs" buildroot-build &&
  mkdir -p output &&
  docker cp buildroot_rootfs:/output/rootfs.tar ./output/ && true
