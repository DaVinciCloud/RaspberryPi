#!/bin/bash

# Set up script for new logins / passwords


###############################################################################
# CHECK - SUDO
###############################################################################
# Init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#....
# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"; 1>&2; exit 1
fi

###############################################################################
# MENU
###############################################################################
f_interface(){
clear
echo " "
echo "###############################################################################"
echo "  SSH KEY PAIR "
echo "###############################################################################"
echo " "
echo " [1] SSH Keys - Generate / Copy"
echo " [0] Exit"
echo " "
echo "###############################################################################"
echo " "
echo -n "     Enter your choice: "
read -p " " menuchoice
echo " "
echo "###############################################################################"
echo " "
case $menuchoice in
	1) f_sshkeys ;;
	0) exit 0    ;; 
	*) echo " [!] Incorrect choice - Try Again "
    echo " "
	echo "###############################################################################"
    sleep 3
    f_interface 
esac
}



###############################################################################
#  SSH KEYS
###############################################################################
f_sshkeys(){
	clear
  echo " "
  echo "###############################################################################"
  echo " SSH CONFIG"
  echo "###############################################################################"
  echo " "
  echo " [1] Generate new SSH keys" 
  echo " [2] Exit to main menu"
  echo " "
	echo "###############################################################################"
	echo " " 
  echo -n "     Enter your choice: "
	read -p "" sshstart
	echo " "
	echo "###############################################################################"
	echo " "
  case $sshstart in 
	  1) f_sshkeys_generate 	;;
	  2) f_interface 			;; 
	  *) echo " [!] Incorrect choice - Try Again "
       echo " "
	     echo "###############################################################################"
       sleep 3
    f_sshkeys
  esac
}

f_sshkeys_generate(){
    clear
    echo " "
    echo "###############################################################################"
    echo " "
    echo " Generating new SSH keys and removing old ones."
    echo " Password is optional and NOT recommended for automatic login."
    echo " "
    echo "###############################################################################"
	  sleep 3
	  cd ~/.ssh/
	  sudo rm *
	  clear
	  echo " "
    echo "###############################################################################"
    echo " "
	  echo " Creating authorized_keys file for passwordless login in ~/.ssh/authorized_keys"	
	  echo " "	
    echo "###############################################################################"
	  sleep 3
	  ssh-keygen -t rsa
	  clear	
	  echo " "
	  echo " Your id_rsa.pub key will be copied into authorized_keys"
	  echo " "
	  sleep 3	
	  cat id_rsa.pub > authorized_keys
	  clear
	  echo " "
	  echo " Creating Private PEM key file for passwordless login in ~/.ssh/"$HOSTNAME".pem"
    echo " "
	  sleep 3
    scp ~/.ssh/id_rsa ~/.ssh/$HOSTNAME.pem
    chmod 400 $HOSTNAME.pem
	  clear
	  echo " "
	  echo "###############################################################################"
	  echo " "
	  echo " Finished!"
	  echo " "
	  echo " Press ENTER to continue"
	  echo " "
	  echo "###############################################################################"
	  read p
    f_interface
}



###############################################################################
f_interface
###############################################################################
echo " "

#
# THEME FONT BY INSTALING 
# TOILET
# ADD THIS LINE INFRONT OF TEXT
#   toilet -f standard -F metal -t 
#
