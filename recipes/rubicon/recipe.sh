#!/bin/bash

# version of your package
VERSION_rubicon=${VERSION_rubicon:-master}

# dependencies of this recipe
DEPS_rubicon=(python)

# url of the package
URL_rubicon=https://github.com/pybee/rubicon-java/archive/master.zip

# md5 of the package
MD5_rubicon=

# default build path
BUILD_rubicon=$BUILD_PATH/rubicon/rubicon-master

# default recipe path
RECIPE_rubicon=$RECIPES_PATH/rubicon

# function called for preparing source code if needed
# (you can apply patch etc here.)
function prebuild_rubicon() {
    true
}

# function called to build the source code
function build_rubicon() {
    cd $BUILD_rubicon
    push_arm

    # Build Java JARs
    make dist/rubicon.jar
    cp dist/rubicon.jar $LIBS_PATH

    # Build JNI component
    cd $JNI_PATH
    if [ -d "$JNI_PATH/rubicon" ]; then
        rm -rf "$JNI_PATH/rubicon"
    fi
    cp -r "$BUILD_rubicon/jni" rubicon

    pop_arm
}

# function called after all the compile have been done
function postbuild_rubicon() {
    true
}
