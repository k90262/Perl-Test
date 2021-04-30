#!/usr/bin/perl -w
use strict;

my $mask = 128;
print "Enter a number as mask:\n";

while($mask = <STDIN>) {
  printf "mask = %b\n", $mask;
  for(my ($i, $bit) = (0, 1); $i<32; $i++, $bit<<=1) {
    print "Bit $i is set!\n" if $mask & $bit;
  }
}
