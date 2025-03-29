WKS_FILE = "beaglebone-yocto-dual.wks.in"
IMAGE_BOOT_FILES:append = " boot.scr"
EXTRA_IMAGEDEPENDS:remove = " u-boot-scr"

# Optimizations for RAUC adaptive method 'block-hash-index'
# rootfs image size must to be 4K-aligned
IMAGE_ROOTFS_ALIGNMENT = "4"
# ext4 block and inode size should be set to 4K
EXTRA_IMAGECMD:ext4 = "-i 4096 -b 4096"

IMAGE_INSTALL:append = " rauc"


# TODO:
# This changes affects core-image-bbb only,
# MOVE these changes to machine or distro file to affect all images
