. /steps-after/env/buildvars-cross
. /steps-after/env/env-x64

mkdir $X64_BUILDROOT/llvm-build
cd $X64_BUILDROOT/llvm-build

cmake -DLLVM_ENABLE_PROJECTS=clang \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_C_COMPILER=gcc \
      -DCMAKE_CXX_COMPILER=g++ \
      -DLLVM_DEFAULT_TARGET_TRIPLE="x86_64-linux-musl" \
      -DCMAKE_SYSROOT=/x86_64 \
      -DCMAKE_INSTALL_PREFIX=/x86_64/usr \
      -G "Unix Makefiles" ../src/llvm-project-19.1.0.src/llvm

make -j${JOBS} && make install
