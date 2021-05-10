#!/bin/sh
networkName="myNetwork"

########################## remove a Container named appacheMy if exist #####################3
containerName="appacheMy"
imageName="appachemy"
if [ "$(docker ps | grep -o  $containerName)" == "$containerName" ] # check if it is running to stop it
then
docker stop $containerName > /dev/null
fi

if [ "$(docker ps -a | grep -o  $containerName)" == "$containerName" ] # check if it exist to remove it
then
docker rm $containerName > /dev/null
fi


#######################################################################################

#######################################################################################
# command to be exxecuted in in new tmux session

appacheMyFile="./appacheMy/appachMyRun.sh"

#######################################################################################



tmux new-session -d -s $containerName $appacheMyFile # open new tmux session named by the containerName 

