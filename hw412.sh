cut -d "," -f 18 data.txt| #get the funding agency id column
sed 1d| #remove the first row, which is the column name
sort|#sort the id values so the command "uniq" can get the ids only appearing once
uniq --unique|#get unique ids
awk "NF" > funding_agency_set.txt #remove empty rows and store the final id numbers

