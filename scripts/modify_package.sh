#!/bin/env python3
#
#  The workflow to change openssl or any package and shipping it into Yocto
#  image.
#
#  1. change openssl package
#  2. rebuild openssl package
#  3. integragte it into your image
#
#

$ bitbake -e openssl | grep ^S=
$ cd ${S}
<Edit the Files>
<Edit the Files>
<Edit the Files>
bitbake -c compile -f openssl
bitbake -f openssl
./make.sh

