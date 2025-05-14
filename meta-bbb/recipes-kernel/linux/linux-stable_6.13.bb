require linux-stable.inc

KERNEL_CONFIG_COMMAND = "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig"

COMPATIBLE_MACHINE = "bbb"

KERNEL_DEVICETREE ?= " \
    ti/omap/am335x-boneblack.dtb \
    ti/omap/am335x-boneblack-wireless.dtb \
    ti/omap/am335x-boneblue.dtb \
    ti/omap/am335x-bonegreen.dtb \
    ti/omap/am335x-bonegreen-wireless.dtb \
    ti/omap/am335x-pocketbeagle.dtb \
"

LINUX_VERSION = "6.13"

FILESEXTRAPATHS:prepend := "${THISDIR}/linux-stable-${LINUX_VERSION}:${THISDIR}/linux-stable-${LINUX_VERSION}/dts:"

S = "${WORKDIR}/git"

PV = "6.13.1"
SRCREV = "16dc8d5d6fc132f09b3fa6021f94f11c60e39957"
SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=linux-${LINUX_VERSION}.y \
    file://defconfig \
    file://am335x-boneblack.dts \
"

do_configure:prepend() {
    cp ${WORKDIR}/*.dts ${S}/arch/arm/boot/dts/ti/omap
}

do_rootfs:append() {
    install -d ${IMAGE_ROOTFS}/boot

    install -m 0644 ${DEPLOY_DIR_IMAGE}/zImage ${IMAGE_ROOTFS}/boot/zImage

    for dtb in ${KERNEL_DEVICETREE}; do
        if [ -f ${DEPLOY_DIR_IMAGE}/$dtb ]; then
            install -m 0644 ${DEPLOY_DIR_IMAGE}/$dtb ${IMAGE_ROOTFS}/boot/
        fi
    done
}
