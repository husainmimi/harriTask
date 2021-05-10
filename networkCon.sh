#!/bin/sh
#             This sctipt create a network named myNetwork and connect 
#             
#	      also remove myNetwork if Exist
#             this Script is runned by appache.sh that shutdown serverSide and clientSide
##########################removemyNetowk#############################################
networkName="myNetwork"
if [ "$(docker network ls | grep -o  $networkName)" == "$networkName" ]
then
docker network rm $networkName > /dev/null
fi

#######################################################################################
docker network create $networkName > /dev/null


