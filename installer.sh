#!/bin/sh
#
#command wget https://raw.githubusercontent.com/emilnabil/xcplugin/main/installer.sh -O - | /bin/sh  
#
#
#
echo ' download and install plugin XCplugin '
echo ' ====================================================================='
wget -O /var/volatile/tmp/XCplugin.tar.gz "https://raw.githubusercontent.com/emilnabil/xcplugin/main/XCplugin.tar.gz"
wait 
tar xzvpf /tmp/*.tar.gz  -C /
wait
rm -r /var/volatile/tmp/XCplugin.tar.gz                         

echo "========================================================================"
                
	echo ".        WELCOME TO XCPLUGIN "
	
echo "#    PLUGIN INSTALLED SUCCESSFULLY           #"
echo "        UPLOADED BY EMIL_NABIL  "     
echo "#########################################################"
echo "#########################################################"
echo "           RESTARING         "
init 4; 
sleep 4; 
init 3;
exit 0









































