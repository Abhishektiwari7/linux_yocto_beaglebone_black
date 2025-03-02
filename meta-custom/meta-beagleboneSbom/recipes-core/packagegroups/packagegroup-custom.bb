# DESCRIPTION = "Custom package group for BeagleBone Black"
# LICENSE = "MIT"

# inherit packagegroup

# PACKAGES = "\
#     packagegroup-custom-core \
#     packagegroup-custom-network \
#     packagegroup-custom-devtools \
#     packagegroup-custom-wireless \
# "

# # Core System Packages
# RDEPENDS_packagegroup-custom-core = "\
#     bash coreutils findutils util-linux iproute2 \
#     i2c-tools can-utils device-tree-compiler \
# "

# # Networking Packages
# RDEPENDS_packagegroup-custom-network = "\
#     connman dnsmasq openssh avahi-daemon \
# "

# # Development Tools
# RDEPENDS_packagegroup-custom-devtools = "\
#     git python3 python3-pip make gcc g++ \
# "

# # Wireless & Bluetooth
# RDEPENDS_packagegroup-custom-wireless = "\
#     wpa-supplicant bluez5 \
# "
# #below list of full package config

SUMMARY = "Complete package group for BeagleBone Black (BBB) with all required software"
DESCRIPTION = "Includes all installed packages and user-space binaries from the Debian Buster IoT image"
LICENSE = "MIT"

inherit packagegroup

PACKAGES = "\
    packagegroup-bbb-core \
    packagegroup-bbb-network \
    packagegroup-bbb-devtools \
    packagegroup-bbb-bsp \
    packagegroup-bbb-ui \
"

# Core System Utilities
RDEPENDS_packagegroup-bbb-core = "\
    coreutils \
    findutils \
    util-linux \
    procps \
    psmisc \
    tar \
    gzip \
    bzip2 \
    xz \
    nano \
    vim \
    bash \
    shadow \
    grep \
    sed \
    gawk \
    diffutils \
    udev \
    eudev \
    systemd \
    systemd-boot \
    cron \
    hostname \
    pciutils \
    usbutils \
    lsb \
"

# Networking Packages
RDEPENDS_packagegroup-bbb-network = "\
    openssh \
    wget \
    curl \
    networkmanager \
    dnsmasq \
    avahi \
    wireless-tools \
    wpa-supplicant \
    connman \
    hostapd \
    iproute2 \
    net-tools \
    ifupdown \
    isc-dhcp-client \
    iputils-ping \
    bridge-utils \
    openvpn \
"

# Development & Debugging Tools
RDEPENDS_packagegroup-bbb-devtools = "\
    gcc \
    g++ \
    make \
    python3 \
    python3-pip \
    perl \
    git \
    gdb \
    strace \
    pkg-config \
    autoconf \
    automake \
    device-tree-compiler \
    flex \
    bison \
    gawk \
    ltrace \
    patch \
    bc \
    ldd \
    file \
    cmake \
"

# BeagleBone Black-Specific Packages
RDEPENDS_packagegroup-bbb-bsp = "\
    i2c-tools \
    can-utils \
    device-tree-compiler \
    config-pin \
    bone101 \
    bonescript \
    pru-software-support-package \
    libpruio-modules \
    ti-pru-cgt \
    libgpio \
    gpiod \
"

# UI & Graphical Utilities (Optional)
RDEPENDS_packagegroup-bbb-ui = "\
    x11-common \
    x11-utils \
    xfconf \
    xfonts-base \
    xfonts-utils \
    xauth \
    xkb-data \
    xorg-server \
    xinit \
    xrandr \
    xterm \
"
