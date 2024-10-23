#/bin/bash
#
#
# Content:
# Ch 01: The build system (aka. poky itself)
# ------ 01.01 Check your host machine eligable to use poky or not
# ------
# ------
# ------
# ------
# ------

###############################################################################
# Chapter 01:  The build system
###############################################################################
#
# ------ 01.01 Check your host machine eligable to use poky or not
# ------ ref: yocto-docs: documentation/ref-manual/system-requirements.rst
python3 ./script/available_space.py . >> log


# Use the ext4 filesystem but configure it not to use journalism on your
# Yocto- dedicated partitions. Be aware that power losses may corrupt your
# build data.

# Mount the filesystem in such a way that read times are not
# written/recorded on file reads, disable write barriers, and delay committing
# filesystem changes with the following mount options:
# noatime,barrier=0,commit=6000


#Installing Poky
# ---------------
# Are you ready to upgrade Poky?
# Are all of your changes sperated away from Poky?
# Do you test your changes on many diff Poky versions?

# There is no right way to structure the build directories when you have
# multiple projects, but a good practice is to have one build directory per
# architecture or machine type.






# Creating a build directory
# ---------------

#> P: 14
# good practice is to have one build directory per architecture or machine type
# FIXME change build -> architecture dir
# source oe-init-build-env ../build/
# source oe-init-build-env ./ti
# source oe-init-build-env ./qemuarm

# Also write template for the new build dir
# Also fix: https://github.com/smalinux/yocto/issues/2


# Each project has its own build/ dir
# Each project has its own local.conf
# vs
# site.conf: will affect all projects
#
# Bitbake read site.conf -> then auto.conf -> then local.conf

# Source bitbake:
#$ source poky/oe-init-build-env ./build/


# Building your first image
#$ bitbake core-image-minimal


# List all available images:
# poky$ ls meta*/recipes*/images/*.bb


# What files parsed when I invoke command: $ bitbake core-image-minimal
# P: 18 & 19



# Installing support for NXP hardware
# ---------------

# list all hardware boards supported:
#$ ls meta-freescale*/conf/machine/*.conf

# list the newly introduced target images:
#$ ls meta-freescale*/recipes*/images/*.bb


# Generate doc
#/home/smalinux/repos/yocto/yocto-docs/documentation$ make singlehtml


###############################################################################
# The BSP Layer    (aka: system development, linux, uboot, etc)
###############################################################################

# Creating a custom BSP layer
## ---------------
$ bitbake-layers create-layer meta-bsp-custom
$ bitbake-layers add-layer meta-bsp-custom

# Adding a custom kernel and bootloader
## ---------------

# Building the U-Boot bootloader
## ---------------

# Describing Linux's build system
## ---------------

# Configuring the Linux kernel
## ---------------

# Building the Linux kernel
## ---------------

# Building external kernel modules
## ---------------

# Debugging the Linux kernel and modules
## ---------------

# Debugging the Linux kernel booting process
## ---------------

# Using the kernel tracing system
## ---------------

# Managing the device tree
## ---------------

# Debugging device tree issues
## ---------------






###############################################################################

# ------ 00.00 the end result from running ./main.sh:
cat ./log
