DATAFILE="/sta141c-hw4/transaction100.zip"
RECIPIENT_COUNTRY_CODE = 34  
ACTION_DATE = 3
FEDERAL_ACTION_OBLIGATION = 12
BUSINESS_CATEGORIES = 61
RECIPIEN_NAME = 56
NASICS_DESCRIPTION = 42
POP_STATECODE = 29

unzip -p ${DATAFILE}|
cut --delimiter="," --fields=${RECIPIENT_COUNTRY_CODE},${ACTION_DATE},${FEDERAL_ACTION_OBLIGATION},${BUSINESS_CATEGORIES},${RECIPIEN_NAME},${NASICS_DESCRIPTION}| 
rep -Ev $'^\t|\t\t|\t$'|
awk 'NF >= 6'|# remove empty lines 
sort | #sort the rows to make unique work properly
uniq --unique>transactions.txt #get unique transactions and store it to file