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
# ADDING - SOURCE LIST
###############################################################################
cat >> /etc/apt/sources.list <<-EOF
# # # # #
# Webmin Binarie 
deb http://download.webmin.com/download/repository sarge contrib
deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib
# # # # #
EOF

###############################################################################
# INSTALL - WEBMIN
###############################################################################
clear
echo " "
echo " All sources were added"
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
clear
sleep
wget http://www.webmin.com/jcameron-key.asc
apt-get add jcameron-key.asc
apt-get update
apt-get -y upgrade
clear
sudo apt-get install -y webmin
clear
sudo apt-get autoremove -y && sudo apt-get clean

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

