#!/bin/bash
#
# UP-SYS SCRIPT: HELPS UPDATE AND UPGRADE, ALSO UPGRADE DISTRO AND KERNEL 
#


###############################################################################
# CHECK - SUDO
###############################################################################
# Init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#....
# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
  echo " "; echo "This script must be run as root" 1>&2; exit 1
fi


sudo apt-get -y autoremove
sudo apt-get clean
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo rpi-update
sudo apt-get -y autoremove
sudo apt-get clean


# df -H # checks hard drive space
