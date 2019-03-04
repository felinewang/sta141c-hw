unique_transactions = "unique_transactions.txt"
first_digit = "first_digit.txt"
DKl_file = "Dkl.txt"
Q_file = "Q.txt"
P_file = "P.txt"
final_data = "final.txt"

obligation_col = 3 #total obligation isin  column 3
id_col = 2 #recipient id is in column 2


#read in the transactions as table
lines = readLines(file_path) 
transactions = read.table(text = lines, sep = ",")
  
#replace the obligation column with the first digit of the total obligation
transactions[,obligation_col] = substring(chunk[,obligation_col],1L,1L)
  
transactions = transactions[,id_col:obligation_col] #get only recipient id and total obligation
colnames(transactions) = c("recipient_id","first_digit") #assign column names
  
transactions = na.omit(transactions) #ignore the cases starts with -
transactions = transactions[-which(transactions$first_digit==0),] #ignore the cases starts with 0
cont_table = table(transactions$recipient_id,transactions$first_digit) #get the contigency table of the count of 1-9 for each agency

#write the number of times 1-9 appear as the first digit for each agency to the first_digit file
write.table(cont_table, first_digit, sep = ",", quote = FALSE)

#exclude recipients that have fewer than 100 transactions and write it to the final_data file for final analysis
meaningful = cont_table[which(rowSums(cont_table)>100,),] 
write.table(meaningful,final_data,sep = ",",quote = FALSE)

#get P,Q,Dkl
P = prop.table(meaningful)
Q = prop.table(colSums(meaningful))
Dkl = rowSums(P*log(P/Q))

write.table(P,P_file,sep = ",",quote = FALSE)
write.table(Q,Q_file,sep = ",",quote = FALSE)
write.table(Dkl, DKl_file, sep = ",", quote = FALSE)