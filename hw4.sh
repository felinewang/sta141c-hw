DATAFILE="/scratch/transaction.zip"
#get the first row, which is all the colums
unzip -p ${DATAFILE} | 
    head -n 1 > columns.txt

#seperate the columns to different lines 
tr ',' '\n' columns.txt > cols.txt

#get the columns' integer positions and store it as requested in HW
nl cols.txt> colname_index.txt

