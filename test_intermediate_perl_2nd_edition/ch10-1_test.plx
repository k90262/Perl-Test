#!/usr/bin/perl -w
use strict;
use Data::Dumper;

chdir; # 預設是大家的家目錄
#my @sorted = sort { -s $a <=> -s $b } glob '*';

my @sorted = 
  map $_->[0],
  sort { $a->[1] <=> $b->[1] } 
  map [ $_, -s $_ ], 
  glob '*';

print Dumper( @sorted );
