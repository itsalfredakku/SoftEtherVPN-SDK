#!/bin/bash
export CC=clang;
export CROSS_TOP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer
export CROSS_SDK=iPhoneOS.sdk
export PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH"

set -e

export CURDIR=`pwd`

# ios
export INSTALL_DIR=$(pwd)/platform/ios/libsoftether/Release/ios
mkdir -p build
cd build


export IOS_TOOLCHAIN_FILE=${CURDIR}/../ios-cmake/ios.toolchain.cmake


declare -a PLATFORMS=("OS" "OS64" "SIMULATOR" "SIMULATOR64")
PLATFORM="OS64"

cmake ../SoftEtherVPN -G "Xcode" -DENABLE_BITCODE=0 \
    -DCMAKE_TOOLCHAIN_FILE=$IOS_TOOLCHAIN_FILE \
    -DPLATFORM=$PLATFORM \
    -DCMAKE_BUILD_TYPE=Debug \
    -DLWS_WITH_LWSWS=0 \
    -DLWS_WITH_MBEDTLS=0 \
    -DLWS_WITHOUT_TESTAPPS=1 \
    -DCMAKE_INCLUDE_PATH=$(brew --prefix ncurses)/include \
    -DCMAKE_LIBRARY_PATH=$(brew --prefix ncurses)/lib \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ../
    -OPENSSL_ROOT_DIR=/Users/aksbju/Documents/GitHub/SoftEtherVPN-SDK/libcrypto


cmake --build . --config Debug --target install