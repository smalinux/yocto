#!/bin/bash

# Settings
# --------------
THIS_FILE=$(realpath "$(dirname "${BASH_SOURCE[0]}")")


# FIXUP Ubuntu 24
#sudo echo 0 > /proc/sys/kernel/apparmor_restrict_unprivileged_userns

source $THIS_FILE/poky/oe-init-build-env \
   $THIS_FILE/build/beaglebone/
cd $THIS_FILE
