#!/bin/bash

VERSION=1.1.1c
if [[ -z $ANDROID_NDK_HOME && -z $1 ]]; then
    echo "ANDROID_NDK_HOME environment variable must be set or passed in as arg. Ex: ~/Android/Sdk/ndk/20.*.*";
    exit 1;
fi

if [[ ! -z $1 ]]; then
    export ANDROID_NDK_HOME=$1
fi
ANDROID_API=24

if [ ! -f "openssl-$VERSION.tar.gz" ]; then
    wget https://www.openssl.org/source/openssl-$VERSION.tar.gz
fi

for arch in "x86_64" "x86" "arm64" "arm"
do
    rm -fr $arch
    mkdir $arch
    rm -fr openssl-$VERSION
    tar xfa openssl-$VERSION.tar.gz
    cd openssl-$VERSION

    case $arch in
        arm)
            ANDROID_API=24
            ;;
        x86)
            ANDROID_API=24
            ;;
        arm64)
            ANDROID_API=24
            ;;
        x86_64)
            ANDROID_API=24
            ;;
    esac
    ANDROID_TOOLCHAIN=""
    for host in "linux-x86_64" "linux-x86" "darwin-x86_64" "darwin-x86"
    do
        if [ -d "$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$host/bin" ]; then
            ANDROID_TOOLCHAIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$host/bin"
            break
        fi
    done

    export PATH="$ANDROID_TOOLCHAIN":"$PATH"

    ./Configure shared android-${arch} -D__ANDROID_API__=${ANDROID_API} || exit 1
    make depend
    make -j$(nproc) build_libs || exit 1
    llvm-strip -strip-all libcrypto.so
    llvm-strip -strip-all libssl.so
    cp libcrypto.so ../$arch
    cp libssl.so ../$arch
    cd ..
done

for arch in "x86_64" "x86" "arm64" "arm"; do
    cd $arch;
    for i in `ls`; do
        sha256sum $i > $i.sum256;
    done;
    cd ..;
done
