DATAFILE="/group/staclassgrp/transaction.zip"
#get the first row, which is all the colums
unzip -p ${DATAFILE} | 
    head -n 1 > columns.txt
    
#get the entire file
unzip -p ${DATAFILE} > data.txt

#get the length of the longest line in the file 
wc  --max-line-length  data.txt > maxchars.txt
