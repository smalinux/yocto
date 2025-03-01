#!/bin/bash

# Settings
# --------------
MACHINE=bbb
#MACHINE=beaglebone
#MACHINE=container


# FIXUP Ubuntu 24
#sudo echo 0 > /proc/sys/kernel/apparmor_restrict_unprivileged_userns

THIS_FILE=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
source $THIS_FILE/poky/oe-init-build-env $THIS_FILE/build/$MACHINE/
cd $THIS_FILE
