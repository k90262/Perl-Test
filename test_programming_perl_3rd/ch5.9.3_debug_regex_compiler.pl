#!/usr/bin/perl -w
use strict;
use re "debug";
"Smeagol" =~ /^Sm(.*)g[aeiou]l$/;

=pod

=head1 run and output

  ~/Projects/perl_code/Perl-Test/test_programming_perl_3rd (develop ✗) perl ch5.9.3_debug_regex_compiler.pl 
  Compiling REx "^Sm(.*)g[aeiou]l$"
  Final program:
     1: SBOL /^/ (2)
     2: EXACT <Sm> (4)
     4: OPEN1 (6)
     6:   STAR (8)
     7:     REG_ANY (0)
     8: CLOSE1 (10)
    10: EXACT <g> (12)
    12: ANYOF[aeiou] (22)
    22: EXACT <l> (24)
    24: SEOL (25)
    25: END (0)
  anchored "Sm" at 0..0 floating "l"$ at 4..9223372036854775807 (checking anchored noscan) anchored(SBOL) minlen 5 
  Matching REx "^Sm(.*)g[aeiou]l$" against "Smeagol"
  Intuit: trying to determine minimum start position...
    Looking for check substr at fixed offset 0...
  Intuit: Successfully guessed: match at offset 0
     0 <> <Smeagol>            |   0| 1:SBOL /^/(2)
     0 <> <Smeagol>            |   0| 2:EXACT <Sm>(4)
     2 <Sm> <eagol>            |   0| 4:OPEN1(6)
     2 <Sm> <eagol>            |   0| 6:STAR(8)
                               |   0| REG_ANY can match 5 times out of 2147483647...
     4 <Smea> <gol>            |   1|  8:CLOSE1(10)
     4 <Smea> <gol>            |   1|  10:EXACT <g>(12)
     5 <Smeag> <ol>            |   1|  12:ANYOF[aeiou](22)
     6 <Smeago> <l>            |   1|  22:EXACT <l>(24)
     7 <Smeagol> <>            |   1|  24:SEOL(25)
     7 <Smeagol> <>            |   1|  25:END(0)
  Match successful!
  Freeing REx: "^Sm(.*)g[aeiou]l$"

=cut
