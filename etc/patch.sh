#!/bin/bash

if [ "$1x" == "x" ]
then
	echo "Usage:"
	echo "$0 /path/to/wildfly"
	exit
else
	echo Patching: $1..

	echo Copying metrics jar..
	cp ../target/mod_cluster-custom-metric-example-1.0-SNAPSHOT.jar $1/modules/system/layers/base/org/jboss/mod_cluster/core/main/

	echo Patching module.xml..
	cp module.xml $1/modules/system/layers/base/org/jboss/mod_cluster/core/main/

	echo Patching standalone-ha.xml..
	cp standalone-ha.xml $1/standalone/configuration/

	echo Done.
fi
