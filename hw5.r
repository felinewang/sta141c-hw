file_path = "first_digit.txt"
DKl_file = "Dkl.txt"
Q_file = "Q.txt"

lines = readLines(file_path) #read in the file produced in step two
transactions = read.table(text = lines,sep = ",")[2:3]

transactions = na.omit(transactions) #ignore the cases starts with -
transactions = transactions[-which(transactions$V3==0),] #ignore the cases starts with 0
cont_table = table(transactions$V2,transactions$V3) #get the contigency table of the count of 1-9 for each agency


meaningful = cont_table[which(rowSums(cont_table)>100,),] #exclude recipients that have fewer than 100 transactions



P = prop.table(meaningful)
Q = prop.table(colSums(meaningful))
Dkl = rowSums(P*log(P/Q))

write.table(Q,Q_file,sep = ",",quote = FALSE)
write.table(Dkl, DKl_file, sep = ",", quote = FALSE)