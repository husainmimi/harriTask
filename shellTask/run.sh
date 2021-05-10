#!/bin/sh

addGender(){
local inputFile=$1
local outputFile=$2
echo "[" >$outputFile
n=1
i=0


until [  "$(jq .[$i] $inputFile)" == null ]
do
	if [ $n -eq 1 ]
	then
		echo "{" >>$outputFile
	else
		echo "," >>$outputFile
		echo "{" >>$outputFile
	fi 
	
	echo '"Index"':$n, >>$output
	echo '"Year"':$(jq .[$i].Year $inputFile), >>$outputFile
	echo '"Age"':$(jq .[$i].Age $inputFile), >>$outputFile
	echo '"Name"':$(jq .[$i].Name $inputFile), >>$outputFile
	echo '"Movie"':$(jq .[$i].Movie $inputFile), >>$outputFile
	echo '"Gender"':$(jq .[$i].Gender $inputFile) >>$outputFile
	echo '}' >>$outputFile



	i=$(( i+1 ))
	n=$(( n+1 ))

done

echo "]" >>$outputFile

}

###################################################
############## first file ################
file1Name="oscar_age_male.json"
file1Link="https://assets.harridev.com/interview/oscar_age_male.json"

##########################################

############## Second file ################
file2Name="oscar_age_female.json"
file2Link="https://assets.harridev.com/interview/oscar_age_female.json"
##########################################

############# Download if not exist ####################

if [ "$(ls | grep -o  $file1Name)" != "$file1Name" ] # check if first file is not exist
then
wget $file1Link
fi

if [ "$(ls | grep -o  $file2Name)" != "$file2Name" ] # check if second file is not exist
then
wget $file2Link
fi
#############################################################################

#################### read from JSON then print in output file############################
output="oscar_age_gender.json"
merge="merge.json"
####################################################################


echo "[" >$merge
n=1
i=0


until [  "$(jq .[$i] $file1Name)" == null ]
do
	if [ $n -eq 1 ]
	then
		echo "{" >>$merge
	else
		echo "," >>$merge
		echo "{" >>$merge
	fi 
	
	echo '"Index"':$n, >>$merge
	echo '"Year"':$(jq .[$i].Year $file1Name), >>$merge
	echo '"Age"':$(jq .[$i].Age $file1Name), >>$merge
	echo '"Name"':$(jq .[$i].Name $file1Name), >>$merge
	echo '"Movie"':$(jq .[$i].Movie $file1Name), >>$merge
	echo '"Gender"':'"M"' >>$merge
	echo '}' >>$merge



	i=$(( i+1 ))
	n=$(( n+1 ))

done
################################################################
i=0
until [ "$(jq .[$i] $file2Name)" == null ]
do
	
	echo "," >>$merge
	echo "{" >>$merge
	 
	
	echo '"Index"':$n, >>$merge
	echo '"Year"':$(jq .[$i].Year $file2Name), >>$merge
	echo '"Age"':$(jq .[$i].Age $file2Name), >>$merge
	echo '"Name"':$(jq .[$i].Name $file2Name), >>$merge
	echo '"Movie"':$(jq .[$i].Movie $file2Name), >>$merge
	echo '"Gender"':'"F"' >>$merge
	echo '}' >>$merge



	i=$(( i+1 ))
	n=$(( n+1 ))

done

echo "]" >>$merge
############################################# DONE#####################################
cat $merge | jq '. |= sort_by(.Year)' >$merge

############# merge hace outputs sorted by years but index is not true###############
#################

addGender $merge $output

####################################################


#cat $output | jq . >$output
#rm $merge
