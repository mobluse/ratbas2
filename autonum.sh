#!/bin/sh
# By millenniumtree, see https://web.archive.org/web/20200530202921/http://temp.murray2.com/threads/basic-without-line-numbers.406/
# read in filename from first parameter
fil="$1"
# remove commented lines, extra newlines, leading whitespace, and number the lines
sed -r "s/^[\t ]*'.*//g" $fil | awk 'NF > 0' | sed -r "s/^[\t ]+//g"| awk '{ print FNR "0 " $0 }' > $fil.num

# find labels
egrep "^[0-9]+ [a-zA-Z0-9_]+:$" $fil.num | while IFS= read -r lbl; do
    linenum=$(echo $lbl | sed -r 's/ .*//')
    sublbl=$(echo $lbl | sed -r 's/.* //')
    subcall=$(echo $sublbl | sed -r 's/://')
    # replace GOSUBs, GOTOs, THENs, and finally the labels
    sed -ri "s/GOSUB[ ]?$subcall/GOSUB $linenum/g" $fil.num
    sed -ri "s/GOTO[ ]?$subcall/GOTO $linenum/g" $fil.num
    sed -ri "s/THEN[ ]?$subcall/THEN $linenum/g" $fil.num
    sed -ri "s/^$lbl/$linenum REM $subcall/g" $fil.num
done
# print numbered file
cat $fil.num
