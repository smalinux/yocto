# Chapter 1. The Build System (Poky it self)
# Chapter 2.
SMA Build Host Packages
SMA Clone Poky
SMA update yocto source to latest
SMA Initialize the Build Environment & Setup env vars & etc ...
SMA Embedded linux Ubuntu 24.04 LTS with yocto error
SMA build & run cycle
SMA add app to all images
SMA create/add new layer
SMA create image
SMA Add htop
SMA package dependencies and splitting
SMA SDKs
SMA Systemd
SMA Configuring network booting for a development setup



- -----------------------------------------------------------------------------
> make your own cheatsheet
> follow yocto mailing list & news
> Read the website: https://www.yoctoproject.org/
< Google: yocto cheat sheet


Why I love Yocto?
- Based on Python not GNU Make. (Readability) (I hate Make syntax)
- Write script to check the build dir have at least 90 Gbytes of free disk
  space (Python)
- -----------------------------------------------------------------------------



SMA Build Host Packages
===============================================================================
bash ./script/apt.sh



SMA Clone Poky
===============================================================================
git clone https://git.yoctoproject.org/git/poky



SMA Initialize the Build Environment & Setup env vars & etc ...
===============================================================================
yocto$ source oe-init-build-env



SMA Embedded linux Ubuntu 24.04 LTS with yocto error
===============================================================================
# echo 0 > /proc/sys/kernel/apparmor_restrict_unprivileged_userns



SMA update yocto source to latest
===============================================================================
poky$ git pull
poky$ git checkout kirkstone-4.0.21



SMA build & run cycle
===============================================================================
$ bitbake core-image-minimal
$ runqemu qemuarm nographic slirp


SMA add app to all images
===============================================================================
local.conf:
CORE_IMAGE_EXTRA_INSTALL += "bc"


SMA create/add new layer
===============================================================================
yocto$ bitbake-layers create-layer meta-live
yocto$ bitbake-layers add-layer meta-live
yocto$ bitbake example



SMA create image
===============================================================================
Ubuntu@yocto $ mkdir ./meta-live/recipes-example/images
Ubuntu@yocto $ cp poky/meta/recipes-core/images/core-image-minimal.bb meta-live/recipes-example/images/example-image.bb
# modified it:
Ubuntu@yocto $ vim meta-live/recipes-example/images/example-image.bb
Ubuntu@yocto $ bitbake example-image


SMA add htop :)
===============================================================================
# Add new recipe
$ devtool -d add https://github.com/htop-dev/htop.git --srcbranch main

# Try to build the recipe
$ devtool build htop

$ devtool edit-recipe htop

$ bitbake htop

# Last step: Add it to the iamge
Ubuntu@yocto $ vim meta-live/recipes-example/images/example-image.bb

# rebuild your image
Ubuntu@yocto $ bitbake example-image



SMA package dependencies and splitting
===============================================================================
DEPENDS = "xyz"    # build time dependency
RDEPENDS_${PN} = "xyz"    # run time dependency

# Splitting: I'm lazy to document it here ...
PACKAGES =+ ""
FILES:${PN}



SMA SDKs
===============================================================================
SDK = development tools (gcc, make, pkgconfig etc.)

3 types from SDKs:
1. Anal plug "tools-sdk" into local.conf (most stupid way to put SDK on target...)
2. populate sdk for ur image (classic way)
3. Extensible SDK

2. populate sdk for ur image (classic way)
===
$ bitbake example-image -c populate_sdk
# ls /home/smalinux/yocto-build/tmp/deploy/sdk

# you will get script.sh & run it
/home/smalinux/yocto-build/tmp/deploy/sdk/poky-glibc-x86_64-example-image-cortexa15t2hf-neon-qemuarm-toolchain-4.0.21.sh

# Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
$ source /home/smalinux/yocto-build/sdk_classic/environment-setup-cortexa15t2hf-neon-poky-linux-gnueabi

<----------------------------------
Dev cycle
---------
on host:
   cd /home/smalinux/repos/yocto/simple_hello
   write code: vim main.c
   $ cmake .
   $ make
   $ scp hello root@192.168.7.2:/home/root

on target:
   $ ./hello
<----------------------------------



3. Extensible SDK
===
https://docs.yoctoproject.org/sdk-manual/extensible.html

$ bitbake example-image -c populate_sdk_ext
# ls /home/smalinux/yocto-build/tmp/deploy/sdk



SMA Systemd
===============================================================================
Done


SMA Configuring network booting for a development setup
===============================================================================
