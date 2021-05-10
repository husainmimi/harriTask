import wget
import os.path
from os import path
import csv
######################### input and outputs##################
file1Url="https://people.sc.fsu.edu/~jburkardt/data/csv/oscar_age_male.csv"
file1Name="oscar_age_male.csv"

file2Url="https://people.sc.fsu.edu/~jburkardt/data/csv/oscar_age_female.csv"
file2Name="oscar_age_female.csv"

outputFileName="oscar_age_gender.csv"
###########################################################################

#### download files if not exist#######
if not path.exists(file1Name):
	wget.download(file1Url)

if not path.exists(file2Name):
	wget.download(file2Url)
##########################################

'''
with open(file1Name, 'r') as infile, \
     open(f"e{file1Name}", 'w') as outfile:
    data = infile.read()
    data = data.replace('"', "")
    data = data.replace('"', "")
    outfile.write(data)

outfile.close()

with open(file2Name, 'r') as infile, \
     open(f"e{file2Name}", 'w') as outfile:
    data = infile.read()
    data = data.replace('"', "")
    outfile.write(data)
outfile.close()
'''

firstFile=open(f"{file1Name}",'r') 
myDict=csv.DictReader(firstFile,delimiter = ',')

movieList=[]
######## add gender to mail
for item in myDict:
	item['Gender']="M"
	movieList.append(item)


########## add fender to femail
secondFile=open(f"{file2Name}",'r') 
myDict=csv.DictReader(secondFile,delimiter = ',')
for item in myDict:
	item['Gender']="F"
	movieList.append(item)
 
 

movieList= sorted(movieList, key=lambda k: k[' "Year"']) 

#########fix index
i=1
for item in movieList:
  item["Index"]=i
  i+=1
  
out= open(outputFileName,"w")
dict_writer= csv.DictWriter(out, movieList[0].keys())
dict_writer.writeheader()
dict_writer.writerows(movieList)
	
out.close()
firstFile.close()
secondFile.close()



