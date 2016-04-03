#!/usr/bin/perl -w
use strict;

use v5.10;

chdir;

my @sorted = 
  map $_->[0],
  sort { $a->[1] <=> $b->[1] }
  map [ $_, -s $_],
  glob '*';

say join "\n", @sorted;
