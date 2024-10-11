SMA Build Host Packages
SMA Clone Poky
SMA update yocto source to latest
SMA Initialize the Build Environment & Setup env vars & etc ...
SMA build & run cycle
SMA add app to all images



- -----------------------------------------------------------------------------
> make your own cheatsheet
> follow yocto mailing list & news
> Read the website: https://www.yoctoproject.org/
< Google: yocto cheat sheet


Why I love Yocto?
- Based on Python not GNU Make. (Readability) (I hate Make syntax)
- Write script to check the build dir have at least 90 Gbytes of free disk
  space (Python)
- -----------------------------------------------------------------------------



SMA Build Host Packages
===============================================================================
bash ./script/apt.sh



SMA Clone Poky
===============================================================================
git clone https://git.yoctoproject.org/git/poky




SMA Initialize the Build Environment & Setup env vars & etc ...
===============================================================================
yocto$ source oe-init-build-env



SMA update yocto source to latest
===============================================================================
poky$ git pull
poky$ git checkout kirkstone-4.0.21



SMA build & run cycle
===============================================================================
$ bitbake core-image-minimal
$ runqemu qemuarm nographic slirp


SMA add app to all images
===============================================================================
local.conf:
CORE_IMAGE_EXTRA_INSTALL += "bc"

