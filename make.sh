#!/bin/bash
set -e
# Settings
# --------------
THIS_FILE=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
IMAGE="core-image-bbb"

# Afer each build
#
bitbake package-index
buildhistory-collect-srcrevs -a -p build/bbb/ > core-image-bbb-packages.txt


#bitbake $IMAGE -c clean
#bitbake $IMAGE
