# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Install necessary packages for Yocto builds
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && \
    apt-get install -y \
    gawk wget nano vim git diffstat unzip texinfo \
    gcc build-essential chrpath socat cpio python3 python3-pip \
    python3-pexpect xz-utils debianutils iputils-ping python3-git \
    python3-jinja2 python3-subunit zstd liblz4-tool file locales \
    libegl1-mesa libelf-dev libsdl1.2-dev lz4 pylint xterm mesa-common-dev libstdc++-12-dev \
    repo \
    libacl1 && \
    locale-gen en_US.UTF-8

ARG USER_ID=1000
ARG GROUP_ID=1000

# Set locale and reconfigure to use bash as the default shell for /bin/sh
RUN export DEBIAN_FRONTEND=noninteractive && \
    echo "dash dash/sh boolean false" | debconf-set-selections && \
    dpkg-reconfigure dash && \
    addgroup --gid $GROUP_ID abhishekdocker && \
    # Add user abhishekdocker with uid & gid 786
    adduser --disabled-password --uid $USER_ID --gid $USER_ID --gecos "" --home /home/abhishekdocker --shell /bin/bash abhishekdocker && \
    # Add abhishekdocker to sudoers and make it passwordless
    adduser abhishekdocker sudo && \
        echo "abhishekdocker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    export LC_ALL="en_US.UTF-8" && export LC_CTYPE="en_US.UTF-8" && export LC_NUMERIC="en_US.UTF-8"



RUN mkdir -p /home/abhishekdocker/yocto-Project
RUN chown abhishekdocker /home/abhishekdocker/yocto-Project
RUN chmod -R 777 /home/abhishekdocker/yocto-Project

USER abhishekdocker
WORKDIR /home/abhishekdocker/yocto-Project


# Set the default user to abhishekdocker
USER abhishekdocker

# Set default locale environment variables
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Add an entry point for further customization or commands
ENTRYPOINT ["/bin/bash"]

# RUN git clone -b scarthgap  --single-branch https://github.com/yoctoproject/poky.git

# WORKDIR /home/yocto/yocto-project/poky

# RUN source oe-init-build-env build
# RUN bitbake core-image-minimal