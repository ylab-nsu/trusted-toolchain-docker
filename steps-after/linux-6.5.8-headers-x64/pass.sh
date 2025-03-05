. /steps-after/env/buildvars-cross
. /steps-after/env/env-x64

cd $X64_BUILDROOT/src/linux-6.5.8
make mrproper
make ARCH=x86_64 headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include /x86_64/usr

