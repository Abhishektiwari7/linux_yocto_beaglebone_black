FILESEXTRAPATHS:prepend = "${THISDIR}/${PN}:"

SRC_URI:append = " file://beaglebone.cfg"

do_configure:append() {
    oe_runmake oldconfig
}

KERNEL_MODULES = " \
    pru_rproc irq_pruss_intc pruss \
    pm33xx remoteproc virtio spidev \
    usb_f_acm usb_f_rndis uio_pdrv_genirq \
"

RDEPENDS:append:kernel-module-${PN} = " ${KERNEL_MODULES}"
