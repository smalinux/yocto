#!/bin/env python3
#
# Quilt workflow - https://docs.yoctoproject.org/dev-manual/quilt.html
#  1. change kmod package
#  2. rebuild kmod package
#  3. integragte it into your image
#
#

$ bitbake -e kmod | grep ^S=
$ cd ${S}
$ quilt new my_changes.patch
$ quilt add tools/kmod.c
<Edit the Files>
$ bitbake -c compile -f kmod
$ quilt refresh
$ SRC_URI += "file://my_changes.patch"
