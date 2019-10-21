#!/bin/sh
# Copyright (C) 2019 by Mikael O. Bonnier, Lund, Sweden.
# Absolutely no warranty. See LICENSE file.
./ratfor/ratfor -C -6 $1 | sed -E -e '1! s/(23[0-9][0-9][0-9])/L\1/g' -e 's/ continue/:/' -e 's/^(L23[0-9]+) /\1:\n/' -e 's/^C(.*)/\x27\1/' -e 's/\x27 (rem|REM)/rem/' -e 's/^ +//' -e 's/.not./not /g' -e 's/.and./and /g' -e 's/.or./or /g' -e 's/.eq./=/g' -e 's/.gt./>/g' -e 's/.lt./</g' -e 's/.ne./<>/g' -e 's/.ge./>=/g' -e 's/.le./<=/g' -e 's/if\((.+)\)/if \1 then /' -e 's/`/;/g' -e 's/(.*)/\U\1/' -ne '1!p' > $1.non
