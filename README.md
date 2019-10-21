# RatBAS
Rational BASIC ─ gives C-like structures to BASIC with only GOTO ─ Uses RatFOR (Rational Fortran).

Convert output from RatFOR into BASIC with labels:
`r2non.sh test.r`

Then convert using [`autonum.sh`](https://murray2.com/threads/basic-without-line-numbers.406/) to a file with line numbers.

The `ratfor` source comes from Raspbian Buster Linux, using `apt source ratfor`, but has been modified to have an extra
argument -6 that translates into Fortran66.

[RATFOR — A Preprocessor for a Rational Fortran](https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf), Brian W. Kernighan

[BASIC without line numbers?](https://murray2.com/threads/basic-without-line-numbers.406/)
