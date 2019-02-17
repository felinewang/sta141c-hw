DATAFILE="/group/staclassgrp/transaction.zip"

unzip -p ${DATAFILE}|
cut --delimiter="," --fields=8,25| #get the 2 column needed
awk '$2!=""'|#remove the empty descriptions
sort --reverse --numeric-sort  --key=1,1 --field-separator=","| #sort transactions
uniq --unique| #get unique transactions
head --lines=3 > largest.csv 