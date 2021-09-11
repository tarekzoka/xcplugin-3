#!/bin/sh
#
#command wget https://raw.githubusercontent.com/emilnabil/xcplugin/main/installer.sh -O - | /bin/sh 
#
wget -O /var/volatile/tmp/xcplugin.tar.gz "https://raw.githubusercontent.com/emilnabil/xcplugin/main/xcplugin.tar.gz"
wait 
tar xzvpf /tmp/xcplugin.tar.gz  -C /
wait
rm -r /var/volatile/tmp/xcplugin.tar.gz                         
                       
echo "========================================================================"
                
	echo ".      WELCOME TO PLUGIN xcplugin "
	
echo "#    plugin INSTALLED SUCCESSFULLY           #"
echo "        UPLOADED BY EMIL_NABIL  "     
echo "#########################################################"
echo "#########################################################"
wait
sleep 2
exit 0































