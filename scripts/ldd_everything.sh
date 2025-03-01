#!/bin/sh
#
# Loop over all binarys on the target device and check if
#


find /usr/bin/ -type f -executable -exec sh -c 'ldd "$1" 2>&1 | grep "found" && echo "Broken: $1"' _ {} \;

