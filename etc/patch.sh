#!/bin/bash

if [ "$1x" == "x" ]
then
	echo "Usage:"
	echo "$0 /path/to/wildfly10"
	exit
else
	echo Patching: $1..

	echo Copying metrics jar..
	cp ../target/mod_cluster-custom-load-metric-example-1.0.0.Final-SNAPSHOT.jar $1/modules/system/layers/base/org/jboss/mod_cluster/core/main/

    echo Backing up module.xml..
    cp $1/modules/system/layers/base/org/jboss/mod_cluster/core/main/module.xml $1/modules/system/layers/base/org/jboss/mod_cluster/core/main/module.xml.original

	echo Overwriting module.xml..
	cp module.xml $1/modules/system/layers/base/org/jboss/mod_cluster/core/main/

	echo Overwriting standalone-ha.xml..
	cp standalone-ha.xml $1/standalone/configuration/

	echo Done.
fi
