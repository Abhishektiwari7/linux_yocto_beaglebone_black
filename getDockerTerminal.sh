#!/bin/bash

# give me docker terminal
sudo docker run --rm -it   -v /home/yocto/Documents/yocto-Project:/home/abhishekdocker/yocto-Project:Z   --user 1000:1000 yocto-env
