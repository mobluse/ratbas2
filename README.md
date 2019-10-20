# RatBAS
Rational BASIC ─ gives C-like structures to BASIC with only GOTO ─ Uses RatFOR (Rational Fortran).

Convert output from RatFOR into BASIC with labels:
```
./ratfor/ratfor -C -6 test.r | sed -E -e '1! s/(23[0-9][0-9][0-9])/L\1/g' -e 's/ continue/:/' -e 's/^(L23[0-9]+) /\1:\n/' -e 's/^C(.*)/\x27\1/' -e 's/\x27 (rem|REM)/rem/' -e 's/^ +//' -e 's/.not./not /g' -e 's/.and./and /g' -e 's/.or./or /g' -e 's/.eq./=/g' -e 's/.gt./>/g' -e 's/.lt./</g' -e 's/.ne./<>/g' -e 's/.ge./>=/g' -e 's/.le./<=/g' -e 's/if\((.+)\)/if \1 then /' -e 's/`/;/g' -e 's/(.*)/\U\1/' -ne '1!p' > test.non
```
Then convert using [`autonum.sh`](https://murray2.com/threads/basic-without-line-numbers.406/) to a file with line numbers.

The `ratfor` source comes from Raspbian Buster Linux, using `apt source ratfor`.

[RATFOR — A Preprocessor for a Rational Fortran](https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf), Brian W. Kernighan

[BASIC without line numbers?](https://murray2.com/threads/basic-without-line-numbers.406/)
