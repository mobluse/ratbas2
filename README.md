# RatBAS
Rational BASIC ─ gives C-like structures to BASIC with only GOTO ─ Uses RatFOR (Rational Fortran).

Convert from RasBAS2 (RatFOR with BASIC V2 in the lines) into BASIC with labels:
`r2non.sh test.r`
The BASIC in RatFOR need to use backtick (\`) instead of semicolon (;).

Then convert using [`autonum.sh`](https://murray2.com/threads/basic-without-line-numbers.406/) to a file with line numbers.

The `ratfor` source comes from Raspbian Buster Linux, using `apt source ratfor`, but has been modified to have an extra
argument `-6` that translates into Fortran 66 instead of Fortran 77.

[RATFOR — A Preprocessor for a Rational Fortran](https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf), Brian W. Kernighan

[BASIC without line numbers?](https://murray2.com/threads/basic-without-line-numbers.406/)
