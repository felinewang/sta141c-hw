DATAFILE="/scratch/transaction.zip"
# For testing from head node:
#DATAFILE="/group/staclassgrp/transaction.zip"

# Example:
unzip -p ${DATAFILE} | 
    head |
    cat > result.txt
