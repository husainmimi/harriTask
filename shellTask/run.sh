#!/bin/sh

############## first file ################
file1Name="oscar_age_female.json"
file1Link= "https://assets.harridev.com/interview/oscar_age_female.json"
##########################################

############## Second file ################
file2Name="oscar_age_male.json"
file2Link= "https://assets.harridev.com/interview/oscar_age_male.json"
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