do_rootfs:append() {
    if [ -f ${IMAGE_ROOTFS}/etc/passwd ]; then
        sed -i 's|/home/root|/root|' ${IMAGE_ROOTFS}/etc/passwd
    else
        echo "WARNING: /etc/passwd not found in IMAGE_ROOTFS, skipping fix."
    fi
}

