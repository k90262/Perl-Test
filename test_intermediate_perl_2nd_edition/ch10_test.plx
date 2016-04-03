#!/usr/bin/perl -w
use strict;

my @sorted = sort qw(Gilligan Skipper Ginger Mary Ann);

print "sorted: @sorted\n";


my @wrongly_sorted = sort 1, 2, 4, 8, 16, 32;

print "wrongly_sorted: @wrongly_sorted\n";


my @numerically_sorted = sort {
  if ($a < $b)	  { -1 }
  elsif ($a > $b) { +1 }
  else		  {  0 }
} 1, 2, 4, 8, 16, 32;

print "numerically_sorted: @numerically_sorted\n";


# spaceship operator
my @numerically_descending = sort { $b <=> $a } 1, 2, 4, 8, 16, 32;
print "numerically_descending: @numerically_descending\n";

my @numerically_ascending = sort { $a <=> $b } 1, 2, 4, 8, 16, 32;
print "numerically_ascending: @numerically_ascending\n";

my @numerically_reverse_ascending = reverse sort { $a <=> $b } 1, 2, 4, 8, 16, 32;
print "numerically_reverse_ascending: @numerically_reverse_ascending\n";
