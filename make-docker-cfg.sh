#!/usr/bin/env bash

jobs="${jobs:-1}"

cat >bootstrap.cfg.docker <<EOL
ARCH=x86
ARCH_DIR=x86
FORCE_TIMESTAMPS=False
CHROOT=True
UPDATE_CHECKSUMS=False
JOBS=$jobs
SWAP_SIZE=0
FINAL_JOBS=2
INTERNAL_CI=False
INTERACTIVE=False
BARE_METAL=False
DISK=sda1
KERNEL_BOOTSTRAP=False
BUILD_KERNELS=False
CONFIGURATOR=False
BUILD_FIWIX=False
CONSOLES=False
BUILD_LINUX=False
EOL

cat >buildvars-cross.docker <<EOL
export I386_MUSL=i386-unknown-linux-musl
export I386_ELF=i386-elf
export X64_MUSL=x86_64-linux-musl
export X64_ELF=x86_64-elf
export I386_BUILDROOT=/after/x86
export X64_BUILDROOT=/after/x86_64
export JOBS=$jobs
EOL

