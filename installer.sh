#!/bin/sh
#
#command wget https://raw.githubusercontent.com/emilnabil/xcplugin/main/installer.sh -O - | /bin/sh
 #
wget -O /var/volatile/tmp/xcplugin-1.6.tar.gz "https://raw.githubusercontent.com/emilnabil/xcplugin/main/xcplugin-1.6.tar.gz"
wait
tar xzvpf /tmp/*.tar.gz -C /
wait
rm -r /var/volatile/tmp/xcplugin-1.6.tar.gz 
echo "========================================================================" 	
echo ". WELCOME TO PLUGIN XCPLUGIN "
	echo " PLUGIN INSTALLED SUCCESSFULLY "
echo " UPLOADED BY EMIL_NABIL " 
echo "#########################################################"
echo "#########################################################"
wait
sleep 2
exit 0






























































