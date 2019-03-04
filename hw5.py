import csv
import numpy
import pandas as pd
inpath = "unique_transactions.txt"
outpath= "digits.txt"
infile = open(inpath)
outfile = open(outpath,"w")


writer = csv.writer(outfile)
reader = csv.reader(infile)
for row in reader:
    try:
        row[2] = row[2][0]
    except IndexError:
        pass
    if (not pd.isnull(row[2])) and row[2] != 0:
        row = row[1:]
        writer.writerow(row)

