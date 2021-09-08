#!/bin/sh
# ===========================================
# SCRIPT : DOWNLOAD AND INSTALL XCPLUGIN
# ===========================================
#
# Command: wget https://raw.githubusercontent.com/emilnabil/xcplugin/main/installer.sh -O - | /bin/sh
#
# ===========================================

# --------------------------------------------------------------------------------------
# Package Type
# --------------------------------------------------------------------------------------
# Mode:
#	0 = Auto	... IPK or DEB (depending on system)
#	1 = ipk		... Example : enigma2-plugin-extensions-xcplugin-iptv-mod-lululla_all.ipk
#	2 = deb		... Example : enigma2-plugin-extensions-xcplugin-iptv-mod-lululla_all.deb
XCPLUGIN_INSTALL_TYPE=0										# File to download/install

# ------------------------------------------------------------------------------------------------------------
# Server Parameters
# ------------------------------------------------------------------------------------------------------------
XCPLUGIN_URL="https://raw.githubusercontent.com/emilnabil/xcplugin/main/"		                                # Custom URL
VER_FILE_NAME='version'									        # Version File Name on Server

# ------------------------------------------------------------------------------------------------------------
#  Check Version
# ------------------------------------------------------------------------------------------------------------
echo ''
echo '***************************************************'
echo '**              xCPLUGIN Installation              *'
echo '***************************************************'
echo ''
echo 'Checking Server Version ...'
XCPUGIN_VER_TMP="/tmp/"$VER_FILE_NAME
rm -f $XCPLUGIN_VER_TMP > /dev/null 2>&1
wget -q -T 2 $XCPLUGIN_URL$VER_FILE_NAME -P "/tmp/"

# ------------------------------------------------------------------------------------------------------------
# Download/Install
# ------------------------------------------------------------------------------------------------------------
if [ -f $XCPLUGIN_VER_TMP ]; then

	# --------------------------------------------
	# Get version from "/tmp/version" file
	# --------------------------------------------
	XCPLUGIN_VERSION=$(cat $XCPLUGIN_VER_TMP | grep version);
	XCPLUGIN_VERSION=$(cut -d "=" -f2- <<< "$AJP_VERSION");

	# Del "/tmp/version"
	rm -f $XCPLUGIN_VER_TMP > /dev/null 2>&1

	# Check Version
	if [ -z "$XCPLUGIN_VERSION" ]; then
		echo ''
		echo 'Installation failed (cannot read version from "version" file) !'
	else
		# Version
		XCPLUGIN_VERSION="v"$XCPLUGIN_VERSION

		# --------------------------------------------
		# Package File Name
		# --------------------------------------------
		XCPLUGIN_IPK="enigma2-plugin-extensions-xcplugin-iptv-mod-lululla_all.ipk"	# E.g. : enigma2-plugin-extensions-xcplugin-iptv-mod-lululla_all.ipk
		XCPLUGIN_DEB="enigma2-plugin-extensions-xcplugin-iptv-mod-lululla_all.deb"$XCPLUGIN_VERSION"_all.deb"	# E.g. : enigma2-plugin-extensions-xcplugin-iptv-mod-lululla_all.deb
		
		if [ $XCPLUGIN_INSTALL_TYPE = 0 ]; then
			if which dpkg > /dev/null 2>&1; then
				XCPLUGIN_FILE=$XCPLUGIN_DEB
			else
				AJP_FILE=$XCPLUGIN_IPK
			fi
		elif [ $XCPLUGIN_INSTALL_TYPE = 1 ]; then
			AJP_FILE=$XCPLUGIN_IPK
		elif [ $XCPLUGIN_INSTALL_TYPE = 2 ]; then
			XCPLUGIN_FILE=$XCPLUGIN_DEB
		else
			XCPLUGIN_FILE="XCPLUGIN_"$XCPLUGIN_VERSION".tar.gz"
		fi

		# --------------------------------------------
		# Download ipk file
		# --------------------------------------------
		echo "Downloading XCPLUGIN $XCPLUGIN_VERSION ($XCPLUGIN_FILE)..."

		# Remove previous files (if any)
		rm -f /tmp/*xcplugin*.ipk /tmp/*ajpanel*.deb /tmp/*xcplugin*.tar.gz > /dev/null 2>&1

		# Download
		wget -q -T 2 $XCPLUGIN_URL$AJP_FILE -P "/tmp/"		# Quiet mode
		#wget -T 2 $XCPLUGIN_URL$XCPLUGIN_FILE -P "/tmp/"			# Shows download details

		# --------------------------------------------
		# Install
		# --------------------------------------------
		XCPLUGIN_PKG_FILE="/tmp/"$XCPLUGIN_FILE
		if [ -f $XCPLUGIN_PKG_FILE ]; then
			# --------------------------------------------
			# Remove older versions (ajpan/ajpanel)
			# --------------------------------------------
			# remove old version
			if which dpkg > /dev/null 2>&1; then
				dpkg --purge --force-all enigma2-plugin-extensions-xcplugin-iptv-mod-lululla_all > /dev/null 2>&1
				dpkg --purge --force-all enigma2-plugin-extensions-xcplugin-iptv-mod-lululla_all > /dev/null 2>&1
			else
				opkg remove --force-remove enigma2-plugin-extensions-xcplugin-iptv-mod-lululla_all > /dev/null 2>&1
				opkg remove --force-remove enigma2-plugin-extensions-xcplugin > /dev/null 2>&1
			fi

			# Clean up
			rm -rf '/usr/lib/enigma2/python/Plugins/Extensions/XCPLUGIN'  > /dev/null 2>&1
			rm -rf './usr/lib/enigma2/python/Plugins/Extensions/XCPLUGIN' > /dev/null 2>&1
			rm -rf '/usr/lib/enigma2/python/Plugins/Extensions/xcplugin'  > /dev/null 2>&1
			rm -rf './usr/lib/enigma2/python/Plugins/Extensions/xcplugin' > /dev/null 2>&1

			echo ""
			echo "***********************************************************************"
			echo "**                                                                    *"
			echo "**                       AJPanel    : $XCPLUGIN_VERSION                          *"
 echo " Uploaded by: Emil_Nabil "
        	
			echo "** welcome XCPLUGIN  *"                                                                 
			echo "***********************************************************************"
			echo ""

			# ------------------------------------------------------------------------
			# Install new version (XCPLUGIN)
			# ------------------------------------------------------------------------
			if [ $AJP_INSTALL_TYPE = 0 ]; then
				if which dpkg > /dev/null 2>&1; then
					apt-get install --reinstall $AJP_PKG_FILE -y			#dpkg -i --force-overwrite $XCPLUGIN_PKG_FILE
				else
					opkg install --force-reinstall $XCPLUGIN_PKG_FILE
				fi
			elif [ $XCPLUGIN_INSTALL_TYPE = 1 ]; then
				opkg install --force-reinstall $AJP_PKG_FILE
			elif [ $AJP_INSTALL_TYPE = 2 ]; then
				apt-get install --reinstall $AJP_PKG_FILE -y				#dpkg -i --force-overwrite $AJP_PKG_FILE
			else
				AJP_FILE="XCPLUGIN_"$XCPLUGIN_VERSION".tar.gz"
			fi

			# Remove Installation file
			rm -f /tmp/*XCPLUGIN*.ipk /tmp/*ajpanel*.deb /tmp/*XCPLUGIN*.tar.gz > /dev/null 2>&1

			# Finishing Note
			echo ""
			echo '***************************************************'
			echo '**                    FINISHED                    *'
			echo '***************************************************'
			echo ""
		else
			echo ''
			echo "Installation failed (download problem) !"
		fi
	fi
else
	echo ''
	echo "Installation failed (cannot get version file from server) !"
	exit 1
fi

# ------------------------------------------------------------------------------------------------------------
