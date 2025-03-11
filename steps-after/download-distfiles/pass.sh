. /steps-after/env/buildvars-cross

# copy sources to src (i386)

cd $I386_BUILDROOT/src
curl -L -O https://github.com/Kitware/CMake/releases/download/v3.31.5/cmake-3.31.5.tar.gz
echo "66fb53a145648be56b46fa9e8ccade3a4d0dfc92e401e52ce76bdad1fea43d27  cmake-3.31.5.tar.gz" | sha256sum -c
tar -xf cmake-3.31.5.tar.gz

curl -L -O https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.0/llvm-project-19.1.0.src.tar.xz
echo "5042522b49945bc560ff9206f25fb87980a9b89b914193ca00d961511ff0673c llvm-project-19.1.0.src.tar.xz" | sha256sum -c
tar -xf llvm-project-19.1.0.src.tar.xz

curl -L -O https://www.busybox.net/downloads/busybox-1.37.0.tar.bz2
echo "3311dff32e746499f4df0d5df04d7eb396382d7e108bb9250e7b519b837043a4 busybox-1.37.0.tar.bz2" | sha256sum -c
tar -xf busybox-1.37.0.tar.bz2

# copy sources to src (x64)

ln -s $I386_BUILDROOT/src/llvm-project-19.1.0.src $X64_BUILDROOT/src/llvm-project-19.1.0.src

cd $X64_BUILDROOT/src

curl -L -O https://www.kernel.org/pub/linux/kernel/v6.x/linux-6.5.8.tar.xz
echo "299cca897d90deaa176eebec42f0a80eeb7516afed330a45c14da9de086cf717  linux-6.5.8.tar.xz" | sha256sum -c
tar -xf linux-6.5.8.tar.xz

cp /external/distfiles/binutils-2.41.tar.xz .
tar -xf binutils-2.41.tar.xz

cp /external/distfiles/gcc-13.3.0.tar.xz .
tar -xf gcc-13.3.0.tar.xz

cp /external/distfiles/musl-1.2.5.tar.gz .
tar -xf musl-1.2.5.tar.gz

cp /external/distfiles/gmp-6.2.1.tar.xz .
tar -xf gmp-6.2.1.tar.xz

cp /external/distfiles/mpc-1.2.1.tar.gz .
tar -xf mpc-1.2.1.tar.gz

cp /external/distfiles/mpfr-4.1.0.tar.xz .
tar -xf mpfr-4.1.0.tar.xz

