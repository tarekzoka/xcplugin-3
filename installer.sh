#!/bin/sh
# ###########################################
# SCRIPT : DOWNLOAD AND INSTALL XcPlugin Forever #
# ###########################################
# Command: wget https://raw.githubusercontent.com/emilnabil/xcplugin/main/installer.sh -qO - | /bin/sh
#
# ###########################################
echo "***********************************************************************************************************************"
# Config script #
TMPDIR='/tmp'
VERSION='1.8'
MY_URL='https://raw.githubusercontent.com/emilnabil/xcplugin/main'
MY_IPK="enigma2-plugin-extensions-xcplugin-forever_1.8_all.ipk"
MY_DEB="enigma2-plugin-extensions-xcplugin-forever_1.8_all.deb"
####################
MY_EM='============================================================================================================'
#  Remove Old Plugin  #
echo "   >>>>   Remove old version   "

rm -r /usr/lib/enigma2/python/Plugins/Extensions/XCplugin

#################################
    
###################
echo "============================================================================================================================"
 echo " DOWNLOAD AND INSTALL PLUGIN "

echo "   Install Plugin please wait "

cd /tmp 

set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

if which dpkg > /dev/null 2>&1; then
		dpkg -i --force-overwrite $MY_DEB; apt-get install -f -y
	else
		opkg install --force-reinstall $MY_IPK
	fi
echo "================================="
set +e
cd ..
wait
rm -f /tmp/$MY_IPK
rm -f /tmp/$MY_DEB
	if [ $? -eq 0 ]; then
echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
fi
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL " 
sleep 4;
echo "  Develop by : Lululla "                            
echo "$MY_EM"
###################                                                                                                                  
echo " your Device will RESTART Now " 
echo "**********************************************************************************"
wait
init 4
init 3
exit 0





















