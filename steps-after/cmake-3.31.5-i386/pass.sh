. /steps-after/env/buildvars-cross
. /steps-after/env/env-i386

mkdir $I386_BUILDROOT/cmake-build
cd $I386_BUILDROOT/cmake-build

../src/cmake-3.31.5/bootstrap LDFLAGS="-Wl,-latomic" --prefix=/usr

make -j${JOBS} && make install
