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
MY_URL="https://raw.githubusercontent.com/emilnabil/xcplugin/main/$PACKAGE_DIR_${VERSION}.ipk"
#####################
MY_URL="https://raw.githubusercontent.com/emilnabil/xcplugin/main/$PACKAGE_DIR_${VERSION}.deb"

MY_EM="***************************************************************************"
################################################################
# Decide : which package ?
if which dpkg > /dev/null 2>&1; then
	echo $MY_EM
echo ''
echo '**  STARTED  **'                                      
echo ''

# Remove previous  any file #
rm -f $MY_TMP_FILE > /dev/null 2>&1
echo $MY_EM
echo 'Downloading '$MY_FILE' ...'
wget -T 2 $MY_URL -P "/tmp/"
############################$$$#$
# Check download
if [ -f $MY_TMP_FILE ]; then
	# Install
	echo 'Install started'
	echo ''
	if which dpkg > /dev/null 2>&1; then
		apt-get install --reinstall $MY_TMP -y
	else
		opkg install --force-reinstall $MY_TMP
	echo ''
	echo $MY_EM
echo "**  Uploaded by: Emil_Nabil  **"
	if [ ? -eq 0 ]; then
		echo "     SUCCESSFULLY INSTALLED   "
  echo $MY_EM
		echo ''
		echo "         RESTARING  ENIGMA     "
			init 4; 
sleep 4; 
init 3;
	exit 0
############              
	








