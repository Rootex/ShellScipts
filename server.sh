#!/bin/bash

#Check if our service is currently running
#Server name indicates the name of the server you want to monitor
ps auxw | grep server-name | grep -v grep 

#if the service is not running it returns a non zero to the environment viriable,
#in that case we start the service, else we ignore.
if [ $? != 0 ]
then
	bash ~/PATH/TO/SERVER #e.g /usr/bin/apache-server
fi
	
