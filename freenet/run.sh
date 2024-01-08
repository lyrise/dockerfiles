#!/bin/bash

cd /freenet

if [ -e /freenet/data/update.sh ]
then
	/freenet/data/update.sh
else
    wget 'https://github.com/hyphanet/fred/releases/download/build01497/new_installer_offline_1497.jar' -O new_installer_offline.jar
    echo INSTALL_PATH=/freenet/data > ./options.properties
	java -jar /freenet/new_installer_offline.jar -console -options ./options.properties
	/freenet/data/run.sh stop
fi

/freenet/data/run.sh console
