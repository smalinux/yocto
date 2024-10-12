# Recipe created by recipetool
# This is the basis of a recipe and may need further editing in order to be fully functional.
# (Feel free to remove these comments when editing.)

# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
# your responsibility to verify that the values are complete and correct.
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRC_URI = "git://github.com/htop-dev/htop.git;protocol=https;branch=main"

# Modify these as desired
PV = "1.0+git${SRCPV}"
SRCREV = "4102862d12695cdf003e2d51ef6ce5984b7136d7"

S = "${WORKDIR}/git"

# NOTE: unable to map the following pkg-config dependencies: hwloc
#       (this is based on recipes that have previously been built and packaged)
# NOTE: the following library dependencies are unknown, ignoring: sensors unwind hwloc systemd
#       (this is based on recipes that have previously been built and packaged)
DEPENDS = "xz libcap ncurses"

# NOTE: if this software is not capable of being built in a separate build directory
# from the source, you should replace autotools with autotools-brokensep in the
# inherit line
inherit pkgconfig autotools

# Specify any options you want to pass to the configure script using EXTRA_OECONF:
EXTRA_OECONF = ""

FILES:${PN} += "/usr/share/icons \
    /usr/share/icons/hicolor \
    /usr/share/icons/hicolor/scalable \
    /usr/share/icons/hicolor/scalable/apps \
    /usr/share/icons/hicolor/scalable/apps/htop.svg \
"
FILES_${PN}-dev = "${libdir}/* ${includedir}"


