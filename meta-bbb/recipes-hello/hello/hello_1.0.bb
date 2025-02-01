SUMMARY = "Hello World Example"
DESCRIPTION = "A simple Hello World application"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://hello.c;md5=b8a1117ddc7310fadac5bbe5b873ba84"

SRC_URI = "file://hello.c"
TARGET_CC_ARCH += "${LDFLAGS}"


S = "${WORKDIR}"

do_compile() {
    ${CC} ${S}/hello.c -o hello
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 "${WORKDIR}/hello" "${D}${bindir}/hello"

	#cp -r ${WORKDIR}/git/go ${D}${PTEST_PATH}/bzip2-tests/go
}

FILES_${PN} = "${bindir}/hello"
