DESCRIPTION = "Use prebuilt kernel"
LICENSE = "CLOSED"

PROVIDES += "virtual/kernel"
COMPATIBLE_MACHINE = "bbb"

SRC_URI = "file://zImage \
           file://am335x-boneblack.dtb \
           file://System.map"

S = "${WORKDIR}"

do_install() {
    install -d ${D}/boot
    install -m 0644 ${WORKDIR}/zImage ${D}/boot/zImage
    install -m 0644 ${WORKDIR}/am335x-boneblack.dtb ${D}/boot/am335x-boneblack.dtb

    # Update the path to System.map to match its actual location
    install -m 0644 ${WORKDIR}/System.map ${D}/boot/System.map
    install -m 0644 ${WORKDIR}/System.map ${WORKDIR}/build/System.map
}

do_deploy() {
    install -d ${DEPLOYDIR}
    install -m 0644 ${WORKDIR}/zImage ${DEPLOYDIR}/zImage
    install -m 0644 ${WORKDIR}/am335x-boneblack.dtb ${DEPLOYDIR}/am335x-boneblack.dtb

    # Deploy the correct System.map location
    install -m 0644 ${WORKDIR}/System.map ${DEPLOYDIR}/System.map
}

FILES_${PN} += "/boot"

do_configure[noexec] = "1"
do_compile[noexec] = "1"
do_kernel_configme[noexec] = "1"
do_kernel_checkout[noexec] = "1"
do_kernel_link_images[noexec] = "1"
do_shared_workdir[noexec] = "1"

inherit kernel
addtask deploy after do_install
