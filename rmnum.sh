#!/bin/sh
# Converts a BASIC V2 program to a program with labels and without line numbers.
# It can often be converted back with another program.
# This program should also handle ON n GOTO and ON n GOSUB.
# Copyright (C) 2019-OCT-10 by Mikael Bonnier, Lund, Sweden.
# Absolutely no warranty. See LICENSE file.

cp $1 $1.non # non = No Number

cat $1.non | sed -E 's/:/\n/g' | sed '/GOSUB/!d' | sed -E 's/.*GOSUB *([0-9]+)/\1/g' | sort -n | uniq | while read lbl; do
    sed -Ei "s/GOSUB *($lbl)/GOSUB L\1/g" $1.non
    sed -Ei "s/^($lbl) /L\1:\n/" $1.non
done
cat $1.non | sed -E 's/:/\n/g' | sed '/GOTO/!d' | sed -E 's/.*GOTO *([0-9]+)/\1/g' | sort -n | uniq | while read lbl; do
    sed -Ei "s/GOTO *($lbl)/GOTO L\1/g" $1.non
    sed -Ei "s/^($lbl) /L\1:\n/" $1.non
done
cat $1.non | sed -E 's/:/\n/g' | sed '/THEN/!d' | sed -E 's/.*THEN *([0-9]+)/\1/g' | sort -n | uniq | while read lbl; do
    sed -Ei "s/THEN *($lbl)/THEN L\1/g" $1.non
    sed -Ei "s/^($lbl) /L\1:\n/" $1.non
done
cat $1.non | sed -E 's/:/\n/g' | sed -E '/ON.+GOSUB/!d' | sed -n -E 's/, *([0-9]+)/#\1\n/pg' | sed -E 's/.*#//' | sed '/^[[:space:]]*$/d' | sort -n | uniq | while read lbl; do
    sed -Ei "/ON.+GOSUB/ s/(.*)[^L]($lbl)/\1,L\2/g" $1.non
    sed -Ei "s/^($lbl) /L\1:\n/" $1.non
done
cat $1.non | sed -E 's/:/\n/g' | sed -E '/ON.+GOTO/!d' | sed -n -E 's/, *([0-9]+)/#\1\n/pg' | sed -E 's/.*#//' | sed '/^[[:space:]]*$/d' | sort -n | uniq | while read lbl; do
    sed -Ei "/ON.+GOTO/ s/(.*)[^L]($lbl)/\1,L\2/g" $1.non
    sed -Ei "s/^($lbl) /L\1:\n/" $1.non
done

sed -Ei 's/^[0-9]+ //' $1.non

cat $1.non
