#get the entire file
unzip -p ${DATAFILE} > data.txt

#get the length of the longest line in the file 
wc  --max-line-length  data.txt > maxchars.txt
