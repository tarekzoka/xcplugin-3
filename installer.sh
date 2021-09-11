#!/bin/sh
# ###########################################
# SCRIPT : DOWNLOAD AND INSTALL xcplugin
# ###########################################
#
# Command: wget https://raw.githubusercontent.com/emilnabil/xcplugin/main/installer.sh -qO - | /bin/sh 
#
# ###########################################


###########################################
MY_URL="https://raw.githubusercontent.com/emilnabil/xcplugin/main/"  

echo " download and install plugin "

wget -O /var/volatile/tmp/xcplugin-1.6.tar.gz "https://raw.githubusercontent.com/emilnabil/xcplugin/main/xcplugin-1.6.tar.gz"
wait
tar xzvpf /tmp/xcplugin-1.6.tar.gz  -C /
wait
sleep 2;
echo "" 
echo "" 
echo "" "*********************************************************" 
echo "# DY AND INSTALLED SUCCESSFULLY #"
echo "          UPLOADED BY EMIL_NABIL "
echo " "*********************************************************" 
echo "#.        YOUR DEVICE WELL RESTART Now #" 
echo "****************************************"
wait 2
init 4
init 3
exit 0






