#!/usr/bin/perl -w
use strict;

my $a = 'nobody';
my $b = 'bodysnatcher';
if ("$a $b" =~ /(\w+)(\w+) \2(\w+)$/) {
  print "$2 overlaps in $1-$2-$3\n";
} 

my $c = 'rococo';
my $d = 'cocoon';
if ("$c $d" =~ /(\w+?)(\w+) \2(\w+)$/) {
  print "$2 overlaps in $1-$2-$3\n";
} 
