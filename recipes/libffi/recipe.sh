#!/bin/bash

# version of your package
VERSION_libffi=${VERSION_libffi:-3.1}

# dependencies of this recipe
DEPS_libffi=()

# url of the package
URL_libffi=ftp://sourceware.org/pub/libffi/libffi-3.1.tar.gz

# md5 of the package
MD5_libffi=

# default build path
BUILD_libffi=$BUILD_PATH/libffi/libffi-3.1

# default recipe path
RECIPE_libffi=$RECIPES_PATH/libffi

# function called for preparing source code if needed
# (you can apply patch etc here.)
function prebuild_libffi() {
    true
}

# function called to build the source code
function build_libffi() {
    cd $BUILD_libffi
    push_arm

    echo try ./configure --host=arm-eabi --prefix="$BUILD_PATH/libffi/libffi-3.1" --enable-shared
    try ./configure --host=arm-eabi --prefix="$BUILD_PATH/libffi/libffi-3.1" --enable-shared
    try $MAKE
    try $MAKE install

    pop_arm
}

# function called after all the compile have been done
function postbuild_libffi() {
    true
}
