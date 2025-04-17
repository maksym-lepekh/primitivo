FROM docker.io/library/alpine:edge@sha256:115729ec5cb049ba6359c3ab005ac742012d92bbaa5b8bc1a878f1e8f62c0cb8

RUN apk add --no-cache cmake ninja-build ninja-is-really-ninja
RUN apk add --no-cache gdb
RUN apk add --no-cache clang20 clang20-extra-tools
RUN apk add --no-cache libc++-dev llvm-libunwind-dev llvm-runtimes

# create symlinks in /usr/bin for LLVM utils
RUN find /usr/lib/llvm20/bin/ -type f -print0 | while IFS= read -r -d '' file; do ln -s ${file} /usr/bin/$(basename ${file}); done

RUN apk add --no-cache libc++-static