FROM scratch

COPY live-bootstrap/seed/stage0-posix/x86/ /x86/
COPY live-bootstrap/seed/stage0-posix/M2-Mesoplanet/ /M2-Mesoplanet/
COPY live-bootstrap/seed/stage0-posix/M2-Planet/ /M2-Planet/
COPY live-bootstrap/seed/stage0-posix/M2libc/ /M2libc/
COPY live-bootstrap/seed/stage0-posix/bootstrap-seeds/ /bootstrap-seeds/
COPY live-bootstrap/seed/stage0-posix/mescc-tools/ /mescc-tools/
COPY live-bootstrap/seed/stage0-posix/mescc-tools-extra/ /mescc-tools-extra/
COPY live-bootstrap/seed/stage0-posix/kaem.x86 /kaem.x86
COPY live-bootstrap/seed/stage0-posix/x86.answers /x86.answers

COPY live-bootstrap/seed/configurator.c /configurator.c
COPY live-bootstrap/seed/configurator.x86.checksums /configurator.x86.checksums
COPY live-bootstrap/seed/preseeded.kaem /preseeded.kaem
COPY live-bootstrap/seed/script-generator.c /script-generator.c
COPY live-bootstrap/seed/script-generator.x86.checksums /script-generator.x86.checksums
COPY live-bootstrap/seed/seed.kaem /seed.kaem
COPY live-bootstrap/seed/after.kaem /after.kaem

COPY live-bootstrap/steps/ /steps/
COPY live-bootstrap/seed/stage0-posix/bootstrap-seeds/POSIX/x86/kaem-optional-seed /init
COPY live-bootstrap/distfiles/ /external/distfiles/

COPY ./bootstrap.cfg.docker /steps/bootstrap.cfg

RUN ["/init"]

## after live-bootstrap

COPY ./steps-after/ /steps-after/
COPY ./buildvars-cross.docker /steps-after/env/buildvars-cross

RUN ["/bin/bash", "-ex", "/steps-after/init/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/download-distfiles/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/busybox-i386/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/cmake-3.31.5-i386/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/binutils-2.41-boot-x64/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/gcc-13.3.0-boot-x64/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/musl-1.2.5-x64/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/linux-6.5.8-headers-x64/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/libstdcpp-boot-x64/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/binutils-2.41-x64/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/gcc-13.3.0-x64/pass.sh"]
RUN ["/bin/bash", "-ex", "/steps-after/llvm+clang-19.1.0-x64/pass.sh"]
