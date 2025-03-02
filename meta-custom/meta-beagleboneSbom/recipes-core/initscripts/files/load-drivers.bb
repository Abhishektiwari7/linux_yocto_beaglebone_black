SUMMARY = "Load character device drivers at boot"
DESCRIPTION = "This script ensures that necessary character device drivers are loaded at startup."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835c84c70f1622a069c9463dc6ae6de"

SRC_URI = "file://load-drivers.sh"

S = "${WORKDIR}"

do_install() {
    install -d ${D}/etc/init.d
    install -m 0755 ${WORKDIR}/load-drivers.sh ${D}/etc/init.d/load-drivers
    ln -sf /etc/init.d/load-drivers ${D}/etc/rcS.d/S99load-drivers
}

FILES:${PN} = "/etc/init.d/load-drivers /etc/rcS.d/S99load-drivers"

INITSCRIPT_NAME = "load-drivers"
INITSCRIPT_PARAMS = "defaults 99"

inherit update-rc.d
