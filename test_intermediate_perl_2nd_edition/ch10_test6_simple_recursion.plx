#!/usr/bin/perl -w
use strict;

print "!3 = " . factorial(3) . "\n";

sub factorial {
  my $n = shift;
  if ($n <= 1) {
    return 1;
  } else {
    return $n * factorial($n - 1);
  }  
}