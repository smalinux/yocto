#!/bin/bash
set -e
# Settings
# --------------
THIS_FILE=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
IMAGE="core-image-bbb"


bitbake $IMAGE -c clean
bitbake $IMAGE
