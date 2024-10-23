FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"

SRC_URI_append = " /home/smalinux/repos/yocto/linux-add-a-custom-device-tree-and-configuration.patch"
COMPATIBLE_MACHINE = "(wandboard|wandboard-custom)"
