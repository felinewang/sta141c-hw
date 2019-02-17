DATAFILE="/group/staclassgrp/transaction.zip"

#part 1.1
COLNAMES = 1 #column names is in first row
unzip -p ${DATAFILE} |
head --lines COLNAMES| #get the first row of the data, which is all the column names 
tr ',' '\n'|#seperate the columns to different lines 
nl cols.txt > colname_index.txt #get the columns' integer positions and store it as requested in HW

#to see the last three column names and integer positions
tail --lines 3 colname_index.txt 

#part1.2
unzip -p ${DATAFILE}|
wc --max-line-length > maxchars.txt #store the length of the longest line in the file to maxchars.txt

#see the result
cat maxchars.txt

#part1.3
unzip -p ${DATAFILE}|
grep  --ignore-case  "bicycle" > bicycle.csv #store all the lines contain bicycle

#see the number of rows contain the string "bycicle"
wc --lines bicycle.csv

#part1.4
AGENCYID = $(grep -n "funding_agency_id" colname_index.txt|
cut --delimiter=":" --fields=1) #get the column number of the funding agency ids, which is 18

unzip -p ${DATAFILE}|
cut --delimiter="," --fields=${AGENCYID}| #get the funding agency id column
sed 1d| #remove the first row, which is the column name
sort|#sort the id values so the command "uniq" can get the ids only appearing once
uniq --unique|#get unique ids
awk "NF" > funding_agency_set.txt #remove empty rows and store the final id numbers

#see the number of unique ids
wc -lines funding_agency_set.txt

#part1.5
OBLIGATION = $(grep -n "total_obligation" colname_index.txt|
cut --delimiter=":" --fields=1) #get the column number of the total_obligation, which is 8
DESCRIPTION = $(grep -n "transaction_description" colname_index.txt|
cut --delimiter=":" --fields=1) #get the column number of the transaction description, which is 25

unzip -p ${DATAFILE}|
cut --delimiter="," --fields= ${OBLIGATION}, ${DESCRIPTION}| #get the 2 column needed
sort --reverse  --key = ${OBLIGATION} --field-separator=","| #sort by obligation
head -lines 4 > largest.csv #since the file contain column names, to get the 3 largest transactions, select the first 4 rows


#part2.4
FEDERAL =  $(grep -n "total_obligation" colname_index.txt|
cut --delimiter=":" --fields=1) #get the column number of the federal obligation
unzip -p ${DATAFILE}|
cut --delimiter="," --fields= ${FEDERAL}, ${AGENCYID} |
sort  --key = ${FEDERAL} --field-seperator = ","| #sort by federal obligation
head - lines 1 | #get the smallest federal obligation and agency id
cut --delimiter="," --fields=2 > smallest_id.txt #get the agency id 





