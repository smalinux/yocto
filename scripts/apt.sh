#!/bin/bash

yes | sudo apt install picocom

yes | sudo apt install libssl-dev device-tree-compiler swig \
python3-dev python3-setuptools

# Ready-made Toolchains
yes | sudo apt-get install gcc-aarch64-linux-gnu

# Needed packages for Crosstool-ng
yes | sudo apt install build-essential git autoconf bison flex texinfo \
help2man gawk libtool-bin libncurses5-dev unzip

# qemu
yes | sudo apt install qemu-user
