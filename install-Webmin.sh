# # # # #
#
#    WEBMIN INSTALLATION SCRIPT  
#    FEBRUARY 2015
#    RUN ON UBUNTU 14.04 LTS 32 BIT @ 02.21.2015
#
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
# INSTALL - WEBMIN
###############################################################################
clear
echo " "
echo " Press ENTER to RUN webmin install"
echo " "
read

apt-get update;
apt-get -y upgrade;
apt-get install -y perl;
apt-get install -y libnet-ssleay-perl;
apt-get install -y libauthen-pam-perl;
apt-get install -y libpam-runtime;
apt-get install -y openssl;
apt-get install -y libio-pty-perl;
apt-get install -y apt-show-versions;
apt-get install -y python;
sudo wget http://prdownloads.sourceforge.net/webadmin/webmin_1.730_all.deb
sudo dpkg --install webmin_1.730_all.deb

clear
echo " "
echo " Webmin was installed successfully"
echo " "
echo " Press ENTER to EXIT"
echo " "
read

#
# TO CHANGE THE DEFAULT PORT: 10000, OPEN:
#    sudo nano /etc/webmin/miniserv.conf
# 
