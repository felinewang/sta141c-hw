DATAFILE="/group/staclassgrp/transaction.zip"
#get the first row, which is all the colums
unzip -p ${DATAFILE} | 
    head  > text.txt

#get the length of the longest line in the file 
wc  --max-line-length  test.txt > maxchars.txt
