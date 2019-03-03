file_path = "unique_transactions.txt"
output = "first_digit.txt"


lines = readLines(file_path) # read all the lines from the unique transactions

  #read in the transactions as table
  transactions = read.table(text = lines, sep = ",")
  
 
  obligation_col = 3 #total obligation isin  column 3
 
  #replace the obligation column with the first digit of the total obligation
  transactions[,obligation_col] = substring(chunk[,lastcol],1L,1L)
  
  
  id_col = 2 #recipient id is in column 2
  transactions = transactions[,id_col:obligation_col] #get only recipient id and total obligation
  colnames(transactions) = c("recipient_id","first_digit") #assign column names
  
  #get the result as a contingency table and store it to output
  result = table(transactions$recipient_id,transactions$first_digit) 
  write.table(result, output, sep = ",", quote = FALSE)

