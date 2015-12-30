Python-Android-support
======================

.. note: DEPRECATED

  This package is no longer under active development. It is retained for
  historical purposes only.

  It takes tha approach of compiling CPython as an embedded library for
  Android, and then bridging between the Python runtime and the Java virtual
  machine using JNI. This is a close analog to the approach taken by
  the `Python-iOS-support`_ library for Apple platforms.

  However, the JNI layer on Android has a number of key restrictions that make
  this approach non-feasible. It also proved to be quite slow.

  The maintainers abandoned this approach in favour of compiling Python bytecode
  directly to Java bytecode. For details on this approach, see `VOC`_.

.. _Python-iOS-support: https://github.com/pybee/Python-iOS-support
.. _VOC: https://github.com/pybee/voc

This is a meta-package for building a version of Python (and supporting libraries)
that can be embedded into an Android project.

It works by downloading, patching and building libraries in Android-compatible
format.

It currently supports the ARM-EABI, which covers most Android devices. MIPS, x86,
and ARM-v7A devices are not currently supported.

This repository branch builds a packaged version of **Python 2.7.2**, using
Android API level 14 (Android 4.0 or higher), using Android NDK 10b.

Quickstart
----------

Pre-built versions of the frameworks can be downloaded_, and added to
your Android project.

.. _downloaded: https://github.com/pybee/Python-Android-support/releases/download/2.7.2-b1/Python-2.7.2-Android-support.b1.tar.gz

Alternatively, to build the frameworks on your own:

#. Download the Android SDK and NDK:

   * SDK:

     - Linux: http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz
     - OS X: http://dl.google.com/android/android-sdk_r23.0.2-macosx.zip

     More details at http://developer.android.com/sdk/index.html

   * NDK:

     - Linux (32 bit host OS): http://dl.google.com/android/ndk/android-ndk32-r10b-linux-x86.tar.bz2
     - Linux (62 bit host OS): http://dl.google.com/android/ndk/android-ndk32-r10b-linux-x86_64.tar.bz2
     - OS X (32 bit host OS): http://dl.google.com/android/ndk/android-ndk32-r10b-darwin-x86.tar.bz2
     - OS X (64 bit host OS): http://dl.google.com/android/ndk/android-ndk32-r10b-darwin-x86_64.tar.bz2

     More details at http://developer.android.com/tools/sdk/ndk/index.html

#. Add the Android SDK `/tools` directory to your path.

#. Launch `android`, and make sure you have all the necessary parts of the SDK. You
   can do this using the graphical interface, or using the command line::

    $ android update sdk -u -a -t android-14

#. Export the following environment variables::

    $ export ANDROIDSDK="/path/to/android/android-sdk-<platform>"
    $ export ANDROIDNDK="/path/to/android/android-ndk-r10b"

   (of course, update these paths to point to the actual SDK and NDK directories)

#. Clone the `Python-Android-support` repository::

    $ git clone git://github.com/pybee/Python-Android-support

#. Build the distribution::

    $ cd Python-Android-support
    $ ./build.sh

   This should:

   1. Download the original source packages.
   2. Patch them as required for Android compatibility
   3. Build the packages into Android-compatible libraries

   The finished products will be be in the `dist` directory, ready for inclusion
   in your Android project.

Acknowledgements
----------------

This project is derived from groundwork provided by `Kivy's Android packaging tools`_.

.. _Kivy's Android packaging tools: http://python-for-android.rtfd.org/
