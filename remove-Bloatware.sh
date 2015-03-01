#!/bin/bash
#
# Remove Un-Necessary programs and files 
#
# Created for Raspberry Pi
#
# Download this Script into your Raspberry Pi from command line by typing:
#
#     wget https://raw.githubusercontent.com/DaVinciCloud/RaspberryPi/master/remove-Bloatware.sh
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


##########################################################################################
#  MENU - MAIN
##########################################################################################
f_interface(){
clear
echo " "
echo "###############################################################################"
echo " "
echo "  CLEANING SCRIPT"
echo " " 
echo "###############################################################################"
echo " "
echo " [ 1 ] Remove WOLFRAM & MATHEMATICA ( ~463 MB)"
echo " [ 2 ] Remove SONIC PI              ( ~ 54 MB)"
echo " [ 3 ] Remove SCRATCH               ( ~ 47 MB)"
echo " [ 4 ] Remove PYTHON                ( ~ 30 MB)"
echo " [ 5 ] Remove DILLO                 ( ~  1 MB)"
echo " [ 6 ] Remove GAMES                 ( ~  8 MB)"
echo " "
echo " [ 7 ] Remove ALL (1-6) "
echo " "
echo " [ 0 ] EXIT "
echo " " 
echo "###############################################################################"
echo " "
echo -n "     Enter your choice: "
read -p "" menuchoice
echo " "
echo "###############################################################################"
echo " "
case  $menuchoice in
	1)  f_wolfran     ;;
	2)  f_sonicPi     ;;
	3)  f_scratch     ;;
	4)  f_python      ;;
	5)  f_dillo       ;;
	6)  f_games       ;;
	7)  f_removeAll   ;;
	0)  exit 0        ;; 
	*)  echo " [!] Incorrect choice - Try Again "
      echo " "
	    echo "###############################################################################"
      sleep 3
      f_interface 
esac
}


###############################################################################$
#  CHOICE - WOLFRAN
##############################################################################
f_wolfran(){
  clear
  echo " "
  sudo apt-get remove --purge -y wolfram-engine
  sleep 3
  echo " "
  sudo apt-get autoremove -y && sudo apt-get clean
  sleep 3
  clear
  echo " "
  echo " Wolfram was removed"
  echo " "
  echo " Press ENTER to continue"
  read p
  f_interface
}


##########################################################################################
#  CHOICE - SONIC PI
##########################################################################################
f_sonicPi(){
  clear
  echo " "
  sudo apt-get remove --purge -y sonic-pi
  sleep 3
  echo " "
  sudo apt-get autoremove -y && sudo apt-get clean
  sleep 3
  clear
  echo " "
  echo " Sonic Pi was removed"
  echo " "
  echo " Press ENTER to continue"
  echo " "
	read p
  f_interface
}


##########################################################################################
#  CHOICE - SCRATCH
##########################################################################################
f_scratch(){
  clear
  sudo apt-get remove --purge -y scratch
  sudo apt-get remove --purge -y squak-vm # (IF INSTALLED)
  sudo apt-get remove --purge -y squeak-plugins-scratch
  sudo apt-get autoremove -y && sudo apt-get clean
  clear
  echo " "
  echo " Scratch was removed"
  echo " "
  echo " Press ENTER to continue"
  echo " "
	read p
  f_interface
}


##########################################################################################
#  CHOICE - PYTHON
##########################################################################################
f_python(){
  clear
  sudo apt-get remove --purge -y python python2.7 python2.7-minimal python3
  sudo apt-get remove --purge -y idle idle2 idle3
  sudo apt-get remove --purge -y cpp-4.6
  sudo apt-get remove --purge -y build-essential
  sudo rm -rf ~/python_games
  sudo rm -rf /opt/vc
  sudo apt-get autoremove -y && sudo apt-get clean
  clear
  echo " "
  echo " Python was removed"
  echo " "
  echo " Press ENTER to continue"
  echo " "
	read p
  f_interface
}


##########################################################################################
#  CHOICE - DILLO
##########################################################################################
f_dillo(){
  clear
  sudo apt-get remove --purge -y dillo
  sudo apt-get autoremove -y && sudo apt-get clean
  clear
  echo " "
  echo " Dillo was removed"
  echo " "
  echo " Press ENTER to continue"
  echo " "
	read p
  f_interface
}


##########################################################################################
#  CHOICE - GAMES
##########################################################################################
f_games(){
  clear
  sudo apt-get remove --purge -y penguinspuzzle
  sudo apt-get remove --purge -y minecraft-pi
  sudo rm -rf /opt/minecraft-pi;
  sudo apt-get autoremove -y && sudo apt-get clean
  clear
  echo " "
  echo " Games were removed "
  echo " "
  echo " Press ENTER to continue"
  echo " "
	read p
  f_interface
}


##########################################################################################
#  CHOICE - REMOVE ALL
##########################################################################################
f_removeAll(){
  clear
  sudo apt-get remove --purge -y wolfram-engine
  sudo apt-get remove --purge -y sonic-pi
  sudo apt-get remove --purge -y scratch
  sudo apt-get remove --purge -y squak-vm # (if installed)
  sudo apt-get remove --purge -y squeak-plugins-scratch
  sudo apt-get remove --purge -y dillo
  sudo apt-get remove --purge -y penguinspuzzle
  sudo apt-get remove --purge -y minecraft-pi
  sudo apt-get remove --purge -y python
  sudo rm -rf /home/pi/python_games
  sudo rm -rf /opt/vc
  sudo rm -rf /opt/minecraft-pi
  sudo apt-get remove --purge -y idle idle2 idle3
  sudo apt-get remove --purge -y cpp-4.6
  sudo apt-get remove --purge -y build-essential
  sudo apt-get autoremove -y && sudo apt-get clean
  clear
  echo " "
  echo " All the Un-Necessary programs were removed"
  echo " "
  echo " Press ENTER to continue"
  echo " "
	read p
  f_interface
}


f_interface

# df -H # checks hard drive space
