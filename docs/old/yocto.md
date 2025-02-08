
SMA: Update/burn complete image to eMMC BBB
SMA: Read layers docs
SMA: Yocto community
SMA: quick notes
SMA: speed up Yocto
SMA: Google it
SMA: Poky Parsing sequence
SMA: test your image with runqemu
SMA: NXP
SMA: repo tool, by Google Android
SMA: burn wic image
SMA: Future dev boards
SMA: Skipped Sections
SMA: Configuring network booting for development setup



SMA: Update/burn complete image to eMMC BBB
===============================================================================







SMA: Read layers docs
===============================================================================
$ f *.txt


SMA: Yocto community
===============================================================================
https://docs.yoctoproject.org/index.html
https://www.openembedded.org/wiki/Main_Page
https://hub.mender.io/

Poky: https://lists.yoctoproject.org/g/main
BitBake: https://lists.openembedded.org/g/bitbake-devel
oe-core layer: https://lists.openembedded.org/g/openembedded-core


SMA: quick notes
===============================================================================
- Read Poky source code
- Read  BitBake source code & go deep
- master all yocto variables
- download layers:
   - https://layers.openembedded.org/layerindex/branch/master/layers/
   -



# Activate build dir:
   $ source poky/oe-init-build-env ./build_bbb/
   # TODO make build dir template: templateconf.cfg - templateconf file
   $ TEMPLATECONF=meta-custom/config source oe-init-build-env <build-dir>

# Start building everything from scratch:
   $ R sstate-cache/

# List all existing images:
   $ cd poky
   $ ls meta*/recipes*/images/*.bb

# find all available machines under this dirs: (file.conf)
   $ f "machine"

# find all available images under this dirs: (file.bb)
   $ f "images"


SMA: speed up Yocto
===============================================================================
BB_SERVER_TIMEOUT = "-1"


SMA: Google it
===============================================================================
initramfs


SMA: Poky Parsing sequence
===============================================================================
See page 18 & 19 <3


SMA: test your image with runqemu
===============================================================================
$ runqemu <machine name> <image>
$ runqemu beaglebone core-image-full-cmdline


SMA: NXP
===============================================================================
https://freescale.github.io/
-
https://community.nxp.com/
-
https://git.yoctoproject.org/meta-freescale/
https://lists.yoctoproject.org/listinfo/meta-freescale
-
   NXP's Linux kernel Git repository:
   http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/
   -
   FSL community Linux kernel Git
   repository: https://github.com/Freescale/linux-fslc.git
   -
   NXP's U-Boot Git repository:
   http://git.freescale.com/git/cgit.cgi/imx/uboot-imx.git/
   -
   FSL community U-Boot Git
   repository: https://github.com/Freescale/u-boot-fslc.git
-
meta-freescale-3rdparty
https://github.com/Freescale/meta-freescale-3rdparty/
-
meta-freescale-distro
https://github.com/Freescale/meta-freescale-distro



SMA: repo tool, by Google Android
===============================================================================
I need to read this tool and understand it deeply,
Maybe I will depend on it or at least get inspiration for making my own tool:

https://source.android.com/setup/downloading
https://source.android.com/setup/using-repo
https://storage.googleapis.com/git-repo-downloads/repo


SMA: burn wic image
===============================================================================
bmaptool is faster/better than dd

$ xz -dc core-image-full-cmdline-beaglebone.rootfs.wic.xz | sudo dd of=/dev/sda conv=fdatasync bs=4M
or:
$ sudo umount /dev/sdN
$ sudo bmaptool copy --nobmap core-image-minimal-wandboard.wic.gz /dev/sdN


SMA: Future dev boards
===============================================================================
https://www.technexion.com/products/system-on-modules/evk
https://www.digi.com/products/embedded-systems/digi-connectcore/single-board-computers/connectcore-6-sbc


SMA: Skipped Sections
===============================================================================
- Using the Toaster web interface
- Running a Toaster Docker container
- Using Docker as a Yocto build system container


SMA: Configuring network booting for development setup
===============================================================================
Uboot fetch Linux from network, then linux fetch rootfs from network too
Only bootloader development work would need you to reprogram the phsical media

< Google: how to develop/update uboot using network too without to SDcard
















