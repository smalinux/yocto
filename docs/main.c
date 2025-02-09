SMA: URLs
SMA: quality
SMA: Read Later
SMA: Quilt
SMA: modify_package
SMA: SDKs
SMA: Debug techniques bitbake


Layer
devtool
classes
> Linux Kernel




- recipe = synonym to package (aka. Htop)
- Add things to local.conf for very quick test/development only

Custom Layer Content:
   - Custom Images
   - Custom recipes

Custom Image
   - List of recipes
   - Create cutsom Image: each Image contain diff list of packages (recipes)
   -





SMA: URLs
===============================================================================
https://git.yoctoproject.org/
https://www.yoctoproject.org/development/yocto-project-compatible-layers/
https://layers.openembedded.org/layerindex/branch/master/layers/

https://www.yoctoproject.org/
https://wiki.yoctoproject.org/wiki/Main_Page
https://docs.yoctoproject.org/ref-manual/resources.html


SMA: quality
===============================================================================
Use Git, not the tarball download


Yocto build steps:
==================
   Fetch – get the source code
   Extract – unpack the sources
   Patch – apply patches for bug fixes and new capability
   Configure – set up your environment specifications
   Build – compile and link
   Install – copy files to target directories
   Package – bundle files for installation



SMA: Read Later
===============================================================================
***** https://wiki.yoctoproject.org/wiki/TipsAndTricks




BBPATH

$ bitbake -e | grep ^BBPATH=
BBPATH="/home/smalinux/repos/yocto/poky/meta-poky:/home/smalinux/repos/yocto/build_bbb:/home/smalinux/repos/yocto/poky/meta:/home/smalinux/repos/yocto/poky/meta-yocto-bsp:/home/smalinux/repos/yocto/meta-arm/meta-arm:/home/smalinux/repos/yocto/meta-arm/meta-arm-toolchain:/home/smalinux/repos/yocto/meta-ti/meta-ti-bsp:/home/smalinux/repos/yocto/meta-ti/meta-ti-extras:/home/smalinux/repos/yocto/meta-bbb"


docs: any variables
https://docs.yoctoproject.org/ref-manual/variables.html


===============================================================================
SMA: Quilt
===============================================================================
#!/bin/env python3
#
# Quilt workflow - https://docs.yoctoproject.org/dev-manual/quilt.html
#  1. change kmod package
#  2. rebuild kmod package
#  3. integragte it into your image
#
#

$ bitbake -e kmod | grep ^S=
$ cd ${S}
$ quilt new my_changes.patch
$ quilt add tools/kmod.c
<Edit the Files>
$ bitbake -c compile -f kmod
$ quilt refresh
$ SRC_URI += "file://my_changes.patch"


===============================================================================
SMA: modify_package
===============================================================================


#!/bin/env python3
#
#  The workflow to change openssl or any package and shipping it into Yocto
#  image.
#
#  1. change openssl package
#  2. rebuild openssl package
#  3. integragte it into your image
#
#

$ bitbake -e openssl | grep ^S=
$ cd ${S}
<Edit the Files>
<Edit the Files>
<Edit the Files>
bitbake -c compile -f openssl
bitbake -f openssl
./make.sh


===============================================================================
12.4 Building a Tiny System:
===============================================================================

poky/scripts/tiny/ksize.py
poky/scripts/tiny/dirsize.py
linux/merge_config.sh  part from: https://git.yoctoproject.org/linux-yocto-dev/
bitbake -u taskexp -g bitbake_target

# GUI table to see how dependencies look like
bitbake -u taskexp -g core-image-bbb




$ bitbake target --runonly=fetch
$ bitbake core-image-minimal --runonly=fetch


===============================================================================
23 Creating a Custom Template Configuration Directory
===============================================================================

Generate template:
   yocto $ bitbake-layers save-build-conf meta-bbb test-1


Use termplate
   yocto $ TEMPLATECONF=/home/smalinux/repos/yocto/meta-bbb/conf/templates/test-1 . /home/smalinux/repos/yocto/poky/oe-init-build-env build-try-test-1


Whatch $ tig



===============================================================================
26.2 Getting Source Files and Suppressing the Build
===============================================================================

Use the following BitBake command form to fetch all the necessary sources
without starting the build:

   $ bitbake <core-image-bbb> --runall=fetch


===============================================================================
39 Using the Quick EMUlator (QEMU)
===============================================================================

QEMU Website: The official website for the QEMU Open Source project.
https://wiki.qemu.org/Main_Page

Documentation: The QEMU user manual.
https://wiki.qemu.org/Documentation


===============================================================================
40 Locking and Unlocking Recipes Using bblock
===============================================================================

$ bblock python3-native
$ bblock -d


runqemu
runqemu-addptable2image
runqemu-export-rootfs
runqemu-extract-sdk
runqemu-gen-tapdevs
runqemu-ifdown
runqemu-ifup


===============================================================================
> Linux kernel
===============================================================================

   1. Find current active kernel
      $ f linux*
   2.

How to find the active kernel recipe
   $ bitbake -e virtual/kernel | grep "^PREFERRED_PROVIDER_virtual/kernel="


Check Kernel Build Directory
   $ bitbake -e virtual/kernel | grep "^S="

I want to run $ make menuconfig
   $ bitbake -c menuconfig linux-upstream



===============================================================================
> devtool
===============================================================================
$ devtool add https://github.com/TheYoctoJester/this_is
$ devtool edit-recipe this_is
$ bitbake this_is
<add to your image>
$ bitbake core-image-bbb



===============================================================================
> Layer
===============================================================================

$ bitbake-layers --help
$ bitbake-layers create-layer --help
$
$



===============================================================================
> Recipe
===============================================================================
Check if recipe exist or not
   $ bitbake-layers show-recipes | grep vim



Q: I want to see var Yocto vars, all at once before build
===============================================================================
   $ bitbake -e > full


SMA: SDKs
===============================================================================
* Write userlevel apps using cross-toolchain
* Two ways:
   1. classic way
   2. extended way (not jsut apps, also devtool, recipes)

Classic way
++++++++++++
   $ bitbake core-image-bbb -c populate_sdk
   $ tmp/deploy/sdk/bla.sh
      repo/sdk/{MACHINE}/
   $ cd repo/sdk/{MACHINE}/environment-setup
   $ source environment-setup-blabla
   ...
   ...
   $ vim hello_world.c
   $ $CC  hello_world.c -o hello_world
   $ scp hello_world root@192.168.7.2:/home/root/



extended way
++++++++++++
   $ bitbake core-image-bbb -c populate_sdk_ext



SMA: Debug techniques bitbake
===============================================================================

1)
   $ bitbake core-image-bbb -DDD > full







SMA: size of current Image
===============================================================================
root@bbb:~# du -hs .
   8.0K    .

root@bbb:~# df -h







