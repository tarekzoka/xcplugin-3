#!/bin/sh

# 
# SCRIPT : DOWNLOAD AND INSTALL xcplugin #
# 
# Command: wget https://raw.githubusercontent.com/emilnabil/xcplugin/main/installer.sh -O - | /bin/sh #
######## 
# my_config #
MY_TMP="/tmp"
VERSION="6.7"
PACKAGE_DIR="enigma2-plugin-extensions-xcplugin-iptv-mod-lululla"
MY_URL="https://raw.githubusercontent.com/emilnabil/xcplugin/main/$PACKAGE_DIR_${VERSION}all.ipk"
######################
MY_URL="https://raw.githubusercontent.com/emilnabil/xcplugin/main/$PACKAGE_DIR_${VERSION}all.deb"

MY_EM="***************************************************************************"
################################################################
	echo $MY_EM
echo ''
echo '**  STARTED  **'                                      
echo ''

# Remove previous  any file #
rm -f $MY_TMP > /dev/null 2>&1
echo $MY_EM

echo 'Downloading '$MY_FILE' ...'

   wget $MY_URL${PACKAGE}_${VERSION}_all.ipk -qP $MY_TMP
    opkg install $MY_TMP/${PACKAGE}_${VERSION}_all.ipk
else
    echo ".       Please Wait ......"
    wget $MY_URL${PACKAGE}_${VERSION}all.deb -qP $MY_TMP
    dpkg install $MY_TMP/${PACKAGE}_${VERSION}all.deb; opkg install -f -y
fi
############################
echo " ============================================================================"
	echo $MY_EM
echo ""
		echo "     SUCCESSFULLY INSTALLED   "
  echo $MY_EM
		echo ''
		echo "         RESTARING  ENIGMA     "
			init 4; 
sleep 4; 
init 3;
	exit 0
############              
	














