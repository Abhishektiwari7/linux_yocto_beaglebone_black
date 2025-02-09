#!/bin/bash

#author : Abhishek Tiwari
#Shell script to setup environment and config files in order to do build image without issue
# Exit immediately if a command exits with a non-zero status
set -e

# Define paths
POKY_DIR="/home/abhishekdocker/yocto-Project/linux_yocto_beaglebone_black/poky"
BUILD_DIR="$POKY_DIR/build"
CONF_DIR="$BUILD_DIR/conf"
MYCONF_DIR="/home/abhishekdocker/yocto-Project/linux_yocto_beaglebone_black/myYoctoConf"
WIC_DIR="$POKY_DIR/meta-yocto-bsp/wic"
BBLAYERS_CONF="bblayers.conf"
LOCAL_CONF="local.conf"
WIC_CONF="beaglebone-yocto.wks"

# Change directory to Poky
cd poky

#Source the Yocto environment
source oe-init-build-env build > /dev/null

# Print the current working directory
# echo -e "My directory right now $(pwd)"

#WIC config updated
echo -e "Copying $WIC_CONF to $WIC_DIR"
cp  "$MYCONF_DIR/$WIC_CONF" "$WIC_DIR/$WIC_CONF"

# Local conf file updated
echo -e "Copying $LOCAL_CONF to $CONF_DIR"
cp  "$MYCONF_DIR/$LOCAL_CONF" "$CONF_DIR/$LOCAL_CONF"

# bblayers conf file updated
echo -e "Copying $BBLAYERS_CONF to $CONF_DIR"
cp  "$MYCONF_DIR/$BBLAYERS_CONF" "$CONF_DIR/$BBLAYERS_CONF"


echo -e "Build core image minimal"
# bitbake strace -c clean
# bitbake -c cleansstate boost
# bitbake boost
# bitbake core-image-minimal -c rootfs
# bitbake gtk+ -c populate_sysroot
# bitbake gtk-immodules -c populate_sysroot

# bitbake-layers show-recipes | grep gtk
# bitbake -c cleansstate gtk+3
# bitbake -c cleansstate gtk+
# bitbake gtk+
# bitbake -g core-image-minimal && cat pn-depends.dot | grep gtk
# bitbake -g core-image-minimal
# cat task-depends.dot | grep desktop

# bitbake desktop-file-utils -c cleanall
bitbake core-image-minimal

# Clone Yocto layers
# git clone -b scarthgap git://git.yoctoproject.org/poky
# cd poky
# git clone -b scarthgap git://git.openembedded.org/meta-openembedded
# git clone -b scarthgap git://git.yoctoproject.org/meta-ti
# git clone -b scarthgap git://git.yoctoproject.org/meta-arm
# cd ..