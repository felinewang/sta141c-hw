DATAFILE="/group/staclassgrp/transaction.zip"


unzip -p ${DATAFILE}|
cut --delimiter="," --fields=8, 25| #get the 2 column needed
awk '$2!=""'|#remove the empty descriptions
sort --reverse --numeric-sort  --key=1,1 --field-separator=","| #sort transactions
head -lines=4  > largest.csv #since the file contain column names, to get the 3 largest transactions, select the first 4 rows

