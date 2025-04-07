SUMMARY = "BBB image is my first image ever!"

#IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"
IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"

IMAGE_LINGUAS = " "

LICENSE = "MIT"

# REMOVEME
inherit core-image

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"

#
# IMAGE_FEATURES
# The IMAGE_FEATURES variable allows extra packages to be added to the generated
# images. Some of these options are added to certain image types automatically. The
# variable can contain the following options:
#  "dbg-pkgs"       - add -dbg packages for all installed packages
#                     (adds symbol information for debugging/profiling)
#  "src-pkgs"       - add -src packages for all installed packages
#                     (adds source code for debugging)
#  "dev-pkgs"       - add -dev packages for all installed packages
#                     (useful if you want to develop against libs in the image)
#  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
#                     (useful if you want to run the package test suites)
#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
#  "tools-debug"    - add debugging tools (gdb, strace)
#  "eclipse-debug"  - add Eclipse remote debugging support
#  "tools-profile"  - add profiling tools (oprofile, lttng, valgrind)
#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
#  "debug-tweaks"   - make an image suitable for development
#                     e.g. ssh root access has a blank password
# There are other application targets that can be used here too, see
# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
#
IMAGE_FEATURES:append =" debug-tweaks"
#IMAGE_FEATURES:append =" lic-pkgs"
IMAGE_FEATURES:append =" package-management"

#
# IMAGE_INSTALL
#
IMAGE_INSTALL:append = " hello"
IMAGE_INSTALL:append = " kmod"
IMAGE_INSTALL:append = " python3"
IMAGE_INSTALL:append = " python3-pip"
IMAGE_INSTALL:append = " openssh"
IMAGE_INSTALL:append = " vim-tiny"
IMAGE_INSTALL:append = " util-linux-lsblk"
IMAGE_INSTALL:append = " alsa-plugins alsa-utils alsa-lib alsa-tools alsa-state alsa-equal"
#IMAGE_INSTALL:append = " dropbear"
#IMAGE_INSTALL:append = " bc"

#
# buildhistory
#
BUILDHISTORY_IMAGE_FILES:append = " /etc/hostname"
BUILDHISTORY_IMAGE_FILES:append = " /etc/fstab"
