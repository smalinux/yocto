#!/bin/bash
#
# https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-packages

sudo apt -y install picocom

sudo apt -y install libssl-dev device-tree-compiler swig \
python3-dev python3-setuptools

# Ready-made Toolchains
sudo apt -y install gcc-aarch64-linux-gnu

# Needed packages for Crosstool-ng
sudo apt -y install build-essential git autoconf bison flex texinfo \
help2man gawk libtool-bin libncurses5-dev unzip

# qemu
sudo apt -y install qemu-user

# TFTP
sudo apt -y install tftpd-hpa

# Install and configure a DHCP server
sudo apt -y install isc-dhcp-server

# NFS server
sudo apt -y install nfs-kernel-server

# bmaptool
sudo apt -y install bmap-tools


# fastboot
sudo apt -y install google-android-platform-tools-installer

# UART flashing
sudo apt -y install lrzsz

# Yocto Dependences
sudo apt -y install lz4 diffstat

# Quilt
sudo apt -y install quilt

# linux kernel cross-compiler
sudo apt -y install gcc-arm-linux-gnueabihf



