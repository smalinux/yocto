#!/bin/bash
set -e
# Settings
# --------------
THIS_FILE=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
IMAGE="core-image-bbb"


#1
bitbake $IMAGE
#2
bash $THIS_FILE/scripts/rootfs_nfs_sync.sh
