FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

UBOOT_MACHINE = "am335x_evm_defconfig"

SRC_URI += "  \
    file://am335x_evm_defconfig \
    file://fw_env.config \
    file://boot.cmd \
"

# The UBOOT_ENV_SUFFIX and UBOOT_ENV are mandatory in order to run the
# uboot-mkimage command from poky/meta/recipes-bsp/u-boot/u-boot.inc
UBOOT_ENV_SUFFIX = "scr"
UBOOT_ENV = "boot"

do_configure:prepend() {
    cp ${WORKDIR}/am335x_evm_defconfig ${S}/configs/
}

do_install:append() {
    install -d ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
}

