import csv
input = "unique_transactions.txt"
output = "first_digit.txt"
infile = open(input)
outfile = open(output,"w")

def main():
    writer = csv.writer(outfile)
    reader = csv.reader(infile)
    for row in reader:
        try:
            row[-1] = row[-1][0]
        except IndexError:
            # Python: Better to ask forgiveness than permission
            # Alternative: Look before you leap
            pass
        writer.writerow(row)

if __name__ == "__main__":
    main()