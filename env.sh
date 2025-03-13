#!/bin/bash

# Settings
# -----------------------------------------------------------------------------
#
# MACHINE
# -----------------
MACHINE=bbb
#MACHINE=beaglebone
#MACHINE=container
#
# TFTP
# -----------------
IMAGE=/mnt/_OUTPUT/tmp/poky-bbb-glibc/deploy/images/
#IMAGE=/mnt/_OUTPUT/tmp/poky-bbb-glibc/deploy/images/bbb
#IMAGE=/mnt/_OUTPUT/tmp/poky-bbb-glibc/deploy/images/bbb
# -----------------------------------------------------------------------------


# FIXUP Ubuntu 24
#sudo echo 0 > /proc/sys/kernel/apparmor_restrict_unprivileged_userns

#
# source oe-init-build-env
#
THIS_FILE=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
source $THIS_FILE/poky/oe-init-build-env $THIS_FILE/build/$MACHINE/
cd $THIS_FILE
# -----------------


#
# TFTP server
# For mountint zImage and dtb files under /srv/tftp/MACHINE
#
sudo mount --bind ${IMAGE} /srv/tftp/
sudo systemctl restart tftpd-hpa
# -----------------
