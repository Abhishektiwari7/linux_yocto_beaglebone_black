

## Yocto Project
    inside local.conf
        PARALLEL_MAKE = "-j4"
        BB_NUMBER_THREADS = "4"

    inside bblayers.conf
    poky/meta 
    poky/meta-poky 
    poky/meta-yocto-bsp 
    poky/meta-ti/meta-beagle 
    poky/meta-ti/meta-ti-bsp 
    poky/meta-ti/meta-ti-extras 
    poky/meta-arm/meta-arm-toolchain 
    poky/meta-arm/meta-arm 
    poky/meta-arm/meta-arm-systemready      

# flash the sdcard
    sudo dd if=tmp/deploy/images/beaglebone/core-image-minimal-beaglebone-yocto-rootfs.wic of=/dev/sdX bs=4M status=progress



## Docker Commands Section

# To run docker system ask for sudo access
    sudo usermod -aG docker $USER
    newgrp docker
    docker ps

# To get the terminal inside docker
    copy the docker id from by the docker ps
    docker exec -it --user root {docker id}  /bin/bash


# To Build Docker File
    docker build -t yocto-env .
# To run Docker:
    sudo docker run --rm -it \ -v /home/yocto/Documents/yocto-Project:/home/abhishekdocker/yocto-Project:Z \ --user 1000:1000 yocto-env

# To give permission to host diretory
    sudo chown -R 1000:1000 /home/yocto/Documents/yocto-Project                                                   
    sudo chmod -R 755 /home/yocto/Documents/yocto-Project