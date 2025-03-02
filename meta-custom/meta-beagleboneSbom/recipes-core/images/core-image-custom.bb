require recipes-core/images/core-image-minimal.bb
IMAGE_INSTALL:append = " packagegroup-custom"
IMAGE_INSTALL:append = " load-drivers"

