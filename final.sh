
cat transaction100.csv|
cut --delimiter="," --fields=34,3,12,61,56,42,29| 
sed 1d| #remove first rows
grep -Ev $'^\t|\t\t|\t$'|
awk 'NF >= 6'|# remove empty lines 
sort | #sort the rows to make unique work properly
uniq --unique>transactions.txt #get unique transactions and store it to file