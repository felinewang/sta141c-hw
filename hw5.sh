DATAFILE="/group/staclassgrp/transaction.zip"

unzip -p ${DATAFILE}|
cut --delimiter="," --fields=3,8,52| #get the three columns used to determine duplicates
sed 1d| #remove the first row, which are the column names
sort | #sort the rows to make unique work properly
uniq --unique>unique_transactions.txt #get unique rows
