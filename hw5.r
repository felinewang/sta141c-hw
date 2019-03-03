file_path = "unique_transactions.txt"
chunk_size = 1e4L
lines = readLines(file_path, n = chunk_size)
output = "first_digit.txt"

while (0<length(lines)){
  chunk = read.table(text = lines, sep = ",")
  
  lastcol = ncol(chunk)
  
  write.table(chunk, output,sep = ",",quote = FALSE, col.names = FALSE, row.names = FALSE)
  
  #read the next line
  lines = readLines(file_path, n = chunk_size)
}
