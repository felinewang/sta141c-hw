file_path = "unique_transactions.txt"
output = "first_digit.txt"

transactions_size = 1e4L #take every 1000 transactions at a time
lines = readLines(file_path, n = transactions_size)

while (0<length(lines)){
  #read in the transactions as table to be processed
  transactions = read.table(text = lines, sep = ",")
  
  id_col = 2 #recipient id is in column 2
  obligation_col = 3 #total obligation isin  column 3
  transactions = transactions[,id_col:obligation_col] #get only recipient id and total obligation
  
  #replace the obligation column with the first digit of the total obligation
  transactions[,obligation_col] = substring(chunk[,lastcol],1L,1L)
  
  #write results to output
  write.table(transactions, output,sep = ",",quote = FALSE, col.names = FALSE, row.names = FALSE)
  
  #read the next chunk of transactions
  lines = readLines(file_path, n = transactions_size)
}