# # # # #
#
#    BTSYNC INSTALLATION SCRIPT
#    FEBRUARY 2015
#    RUN ON @ 02.21.2015
#
#    wget https://raw.githubusercontent.com/DaVinciCloud/RaspberryPi/master/install-Btsync.sh
#
#    sudo dpkg-reconfigure btsync
# # # # #

#!/bin/bash

###############################################################################
# CHECK - SUDO
###############################################################################
# Init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#....
# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
  echo " "; echo "This script must be run as root"; echo " "; 1>&2; exit 1
fi


###############################################################################
# ADDING - SOURCE LIST
###############################################################################
cat >> /etc/apt/sources.list.d/btsync.list <<-EOF
# # # # #
# Btsync Binarie 
deb http://debian.yeasoft.net/btsync wheezy main contrib non-free
deb-src http://debian.yeasoft.net/btsync wheezy main contrib non-free
# # # # #
EOF
gpg --keyserver pgp.mit.edu --recv-keys 6BF18B15
gpg --armor --export 6BF18B15 | sudo apt-key add -



###############################################################################
# INSTALL - BTSYNC
###############################################################################
clear
echo " "
echo " All sources were added to:"
echo " "
echo " /etc/apt/sources.list.d/btsync.list"
echo " "
echo " Press ENTER to RUN btsync install"
echo " "
read
clear
sudo apt-get update
sleep
clear
sudo apt-get install btsync
sleep
clear
rm -r /etc/apt/sources.list.d/btsync.list
sudo apt-get autoremove -y && sudo apt-get clean
sleep
clear
echo " "
echo " btsync  was installed successfully"
echo " "
echo " Press ENTER to check STATUS"
echo " "
read
clear
echo " "
echo " " service btsync status
sleep 3
echo " "

#
# THIS SCRIP WAS CREATED THANKS TO THIS GUIDE:
#
#  https://melgrubb.wordpress.com/2014/08/03/raspberry-pi-home-server-part-14-bittorrent-sync/
#
