require core-image-bbb.bb

DESCRIPTION = "core-image-bbb plus extra development tools"


PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
INHIBIT_PACKAGE_STRIP = "1"


IMAGE_INSTALL:append = " tools-debug"

IMAGE_FEATURES += "dev-pkgs"
IMAGE_FEATURES += "debug-tweaks"
IMAGE_FEATURES += "tools-profile"

