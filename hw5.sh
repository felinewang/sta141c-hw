DATAFILE="/group/staclassgrp/transaction.zip"
action_date = 3
total_obligation = 8
parent_recipient_unique_id = 52

unzip -p ${DATAFILE}|
cut --delimiter="," --fields=3,8,52| #get the three columns used to determine duplicates
sort | #sort the rows to make unique work properly
uniq --unique>unique_transactions.txt #get unique rows
