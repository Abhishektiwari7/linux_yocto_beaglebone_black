#!/bin/sh
### BEGIN INIT INFO
# Provides:          load-drivers
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Load required character drivers at boot
# Description:       This script loads kernel modules needed for character devices.
### END INIT INFO

case "$1" in
    start)
        echo "Loading character device drivers..."
        modprobe gpio_sysfs
        modprobe i2c_dev
        modprobe spidev
        modprobe pwm-tiehrpwm
        modprobe pru_rproc
        ;;
    stop)
        echo "Unloading character device drivers..."
        rmmod pru_rproc
        rmmod pwm-tiehrpwm
        rmmod spidev
        rmmod i2c_dev
        rmmod gpio_sysfs
        ;;
    *)
        echo "Usage: /etc/init.d/load-drivers.sh {start|stop}"
        exit 1
        ;;
esac

exit 0
