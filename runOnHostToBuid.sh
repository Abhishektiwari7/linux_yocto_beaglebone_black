#!/bin/bash

# give me docker terminal
sudo docker run --rm -it   -v /home/yocto/Documents/yocto-Project/linux_yocto_beaglebone_black:/home/abhishekdocker/yocto-Project/linux_yocto_beaglebone_black:Z   --user 1000:1000 yocto-env "./build.sh"
