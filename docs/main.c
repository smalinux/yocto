SMA: Google
SMA: URLs
SMA: quality
SMA: Read Later
SMA: Quilt
SMA: devshell
SMA: modify_package
SMA: SDKs
SMA: Debug techniques bitbake
SMA: Packages
SMA: Don't use me
SMA: RTFM
SMA: dependency graph
SMA: devtool
SMA: yocto-docs
SMA: bbclass
SMA: initramfs
SMA: flash sdcard
SMA: nginx as TFTP server



- recipe = synonym to package (aka. Htop)
- Add things to local.conf for very quick test/development only

Custom Layer Content:
   - Custom Images
   - Custom recipes

Custom Image
   - List of recipes
   - Create cutsom Image: each Image contain diff list of packages (recipes)
   -





SMA: Google
===============================================================================
Google: "yocto beaglebone github"
Google: "Linux kernel out of tree build"


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
SMA: devshell
===============================================================================

bitbake virtual/kernel -c devshell



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



SMA: docker containers
===============================================================================
./poky/meta/classes-recipe/image-container.bbclass

https://www.google.com/search?q=container+yocto&oq=container+yocto&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgWGB4yCAgCEAAYFhgeMggIAxAAGBYYHjINCAQQABiGAxiABBiKBTIHCAUQABjvBTIGCAYQRRg8MgYIBxAuGEDSAQg0MDQwajBqMagCALACAA&sourceid=chrome&ie=UTF-8 | container yocto - Google Search
https://davidjenei.com/blog/podman-yocto.html | Minimal container OS with Yocto for embedded - davidjenei.com
https://github.com/bstubert/dr-yocto | bstubert/dr-yocto: Docker container for Yocto builds
https://witekio.com/blog/5-steps-to-compile-yocto-using-docker-containers/ | 5 Steps to Compile Yocto Using Docker Containers | Witekio
https://www.reddit.com/r/embedded/comments/rcbrt9/how_to_develop_with_docker_and_yocto/?rdt=58669 | How to develop with docker and yocto? : r/embedded
https://vmsoftwarehouse.com/yocto-docker-7-practices-for-linux-development | Yocto & Docker - 7 Practices for Embedded Linux Development
https://medium.com/digitalgate-amg-blog/yocto-development-environment-with-docker-eb221b096b03 | Yocto Development Environment with Docker | by Robert Darius Mandru | DigitalGate Amg Blog | Medium
https://docs.yoctoproject.org/overview-manual/yp-intro.html#the-yocto-project-layer-model | 2 Introducing the Yocto Project — The Yocto Project ® 5.1.999 documentation
https://github.com/crops/poky-container/ | crops/poky-container: A container image that is able to run bitbake/poky. It has helpers to create users and groups within the container. This is so that the output generated in the container will be readable by the user on the host.
https://www.google.com/search?q=Carabiner+yocto&sca_esv=0da53b2a5a128615&sxsrf=AHTn8zq5smy9pKQgeJbNMWSC4F6rVLEqEw%3A1740328667099&ei=2067Z8nSBY68xc8PgpuWmAg&ved=0ahUKEwiJrPq_ndqLAxUOXvEDHYKNBYMQ4dUDCBA&uact=5&oq=Carabiner+yocto&gs_lp=Egxnd3Mtd2l6LXNlcnAiD0NhcmFiaW5lciB5b2N0bzIFECEYoAFInCVQvwFYlyNwAXgBkAEAmAGpAaABygWqAQMxLjW4AQPIAQD4AQGYAgegAusFwgIKEAAYsAMY1gQYR8ICDRAAGIAEGLADGEMYigXCAgUQABiABMICBhAAGBYYHpgDAIgGAZAGCpIHAzEuNqAH0RQ&sclient=gws-wiz-serp | Carabiner yocto - Google Search
https://www.google.com/search?q=oci+yocto&oq=oci+yocto&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgWGB4yCAgCEAAYFhgeMggIAxAAGBYYHjINCAQQABiGAxiABBiKBTINCAUQABiGAxiABBiKBTINCAYQABiGAxiABBiKBTINCAcQABiGAxiABBiKBTINCAgQABiGAxiABBiKBTIGCAkQLhhA0gEINTA0MGowajGoAgCwAgA&sourceid=chrome&ie=UTF-8 | oci yocto - Google Search



SMA: Project setup using "repo" or "kas"
===============================================================================
$ pip install kas

   - kas just another parsing tool for bitbake & yocto
   - U can write your own kas-like script...
   - kas offer more options than $ repo
   - I will stick to git submodules

https://github.com/siemens/kas
https://hub.docker.com/r/kasproject/kas
      //


SMA: Rootfs & NFS setup:
===============================================================================
https://youtu.be/-nnipak67t8?si=Ke8wnXn9IA1nV4Ov
https://wiki.yoctoproject.org/wiki/Poky_NFS_Root
https://fosdem.org/2025/schedule/event/fosdem-2025-6103-usb9pfs-network-booting-without-the-network/
https://github.com/ejoerns/poky-nfsroot


SMA: TODO
===============================================================================
https://news.ycombinator.com/item?id=18083506




SMA: Packages
===============================================================================

Read later:
   https://wiki.yoctoproject.org/wiki/PR_Service

Where is my *.ipk files:
   $ tree /mnt/_OUTPUT/tmp/deploy/ipk/

Generate list of all packages inside of my image:
   $ buildhistory-collect-srcrevs -a -p build/bbb/ > core-image-bbb-packages.txt
   $ bitbake -s | awk '{print $1"-"$2}'
   TODO: automate recipe to pupulate buildhistory-collect-srcrevs into a file
   to track how the system changing

Cmopare between two builds:
  $ buildhistory-diff -a HEAD^ HEAD

Where the package cooked:
   $ bitbake -e virtual/kernel | grep ^WORKDIR=






SMA: Don't use me
===============================================================================
BAD_RECOMMENDATIONS:
NO_RECOMMENDATIONS:
PACKAGE_EXCLUDE:
EXTRA_IMAGE_FEATURES:





SMA: RTFM
===============================================================================
debian manual
   https://www.debian.org/doc/debian-policy/index.html
   Do you want make great desing? here it is, enjoy :)


SMA: dependency graph
===============================================================================
$ bitbake -g <recipename>
$ subl file.dot

# GUI view
$ bitbake -g -u taskexp virtual/kernel
$ bitbake -g -u taskexp_ncurses virtual/kernel


SMA: devtool
===============================================================================
devtool --help
devtool modify --help



SMA: yocto-docs
===============================================================================
How I write my summary:
   devtool-reference.rst <- original
   devtool-reference.c <- my summary

There is no conflicts and I can $ git pull easily


SMA: bbclass
===============================================================================
qemuboot.bbclass



bitbake -e virtual/kernel -c menuconfig


SMA: initramfs
===============================================================================
f *initramfs* | grep core-image-minimal



$ recipetool -h


SMA: flash sdcard
===============================================================================
$ sudo bmaptool copy core-image-bbb-bbb.rootfs.wic.xz /dev/sdX




How to debug barebox recipes & bbclass:
    bitbake barebox -c devshell
    find run.do_configure   # or cd .. and find again
    ./run.do_configure


SMA: nginx as TFTP server
===============================================================================

Ubuntu@yocto $ sudo apt install nginx

sudo chown -R www-data:www-data /mnt/_OUTPUT/tftpd/
sudo chmod -R 755 /mnt/_OUTPUT/tftpd/


sudo useradd -r -d /var/cache/nginx -s /sbin/nologin nginx


