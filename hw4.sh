DATAFILE="/scratch/transaction.zip"
unzip -p ${DATAFILE} | 
    head |
    cat > result.txt
    
tr ',' '\n' result.txt
