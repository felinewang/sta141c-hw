DATAFILE="/sta141c-hw4/transaction100.zip"


unzip -p ${DATAFILE}|
cut --delimiter="," --fields=34,3,12,61,56,42,29| 
rep -Ev $'^\t|\t\t|\t$'|
awk 'NF >= 6'|# remove empty lines 
sort | #sort the rows to make unique work properly
uniq --unique>transactions.txt #get unique transactions and store it to file