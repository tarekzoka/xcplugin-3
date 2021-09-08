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
#
MY_URL="https://raw.githubusercontent.com/emilnabil/xcplugin/main/"		                                # Custom URL
# --------------------------------------------------------------------------------------
# Mode:
#	0 = Auto	... IPK or DEB (depending on system)
wget -O /var/volatile/tmp/xcplugin_01_all.ipk "https://raw.githubusercontent.com/emilnabil/emil_script_package/main/xcplugin_01_all.ipk"
wait
opkg install --force-overwrite /tmp/*.ipk
wait
rm -r /var/volatile/tmp/xcplugin_01_all.ipk
	exit 1
fi

# ------------------------------------------------------------------------------------------------------------
