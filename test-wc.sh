#!/bin/bash
go run wc.go master sequential txt/pg-*.txt
sort -n -k2 mrtmp.wcseq | tail -10 | diff - txt/mr-testout.txt > diff.out

cat txt/mr-testout.txt

if [ -s diff.out ]
then
    echo "Failed test. Output should be as in mr-testout.txt. Your output differs as follows (from diff.out):" > /dev/stderr
    cat diff.out
    exit 1
else
    echo "Passed test" > /dev/stderr
    exit 0
fi

