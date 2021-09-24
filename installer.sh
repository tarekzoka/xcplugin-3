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
VERSION='6.7'
PACKAGE='enigma2-plugin-extensions-xcplugin-iptv-mod-lululla'
MY_URL='https://raw.githubusercontent.com/emilnabil/xcplugin/main'
####################
MY_EM="============================================================================================================"
#  Image Checking  #

if [ -f /etc/opkg/opkg.conf ] ; then
    STATUS='/var/lib/opkg/status'
    OSTYPE='Opensource'
    OPKGINSTAL='opkg install'
    OPKGREMOV='opkg remove --force-depends'
elif [ -f /etc/apt/apt.conf ] ; then
    STATUS='/var/lib/dpkg/status'
    OSTYPE='DreamOS'
    OPKGINSTAL='apt-get install'
    OPKGREMOV='apt-get purge --auto-remove'
    DPKINSTALL='dpkg -i --force-overwrite'
fi

##################################
# Remove previous files (if any) #
rm -rf $TMPDIR/"${PACKAGE:?}"* > /dev/null 2>&1

######################
#  Remove Old Plugin #
if grep -qs "Package: $PACKAGE" $STATUS ; then
    echo "   >>>>   Remove old version   <<<<"
    $OPKGREMOV $PACKAGE
    sleep 1; clear
else
    echo "   >>>>   No Older Version Was Found   <<<<"
    sleep 1; clear
fi

###################
echo "============================================================================================================================"
echo "   Install Plugin please wait "
if [ $OSTYPE = "Opensource" ]; then
    echo "Insallling XcPlugin Forever plugin Please Wait ......"
    wget $MY_URL/${PACKAGE}_${VERSION}_all.ipk -qP $TMPDIR
    $OPKGINSTAL $TMPDIR/${PACKAGE}_${VERSION}_all.ipk
else
    echo "Insallling XcPlugin Forever plugin Please Wait ......"
    wget $MY_URL/${PACKAGE}_${VERSION}_all.deb -qP $TMPDIR
    $DPKINSTALL $TMPDIR/${PACKAGE}_${VERSION}_all.deb; $OPKGINSTAL -f -y
fi

#########################
# Remove any files #
echo $MY_EM
rm -rf $TMPDIR/"${PACKAGE:?}"*

sleep 1; clear
echo ""
echo "****************************************************************************************"
echo $MY_EM                                                                                 
echo "**                            XcPlugin   : $VERSION                                         *"
echo "**                            Develop by : Lululla                                     *"
echo "**                                                                                     *"
echo "****************************************************************************************"
echo ""
echo "
  888888======8===8========8===8
  8==========8=8=8=8=======8===8
  888888====8===8===8======8===8   
  8========8=========8=====8===8 
  888888==8===========8====8===888888 "

if [ $OSTYPE = "Opensource" ]; then
    killall -9 enigma2
else
    systemctl restart enigma2
fi

exit 0
