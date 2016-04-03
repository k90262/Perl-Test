#!/usr/bin/perl -w
use strict;

# my @sorted = sort qw(Gilligan Skipper Professor Ginger Mary_Ann);
# print "@sorted\n";

#      #           0         1        2       3       4
# my @input = qw(Gilligan Skipper Professor Ginger Mary_Ann);
# my @sorted_positions =
#   sort { $input[$a] cmp $input[$b] } 0 .. $#input;
# print "@sorted_positions\n";

# my @input = qw(Gilligan Skipper Professor Ginger Marry_Ann);
# my @sorted_positions = 
#   sort { $input[$a] cmp $input[$b] } 0 .. $#input;
# my @ranks;
# @ranks[@sorted_positions] = (0..$#sorted_positions);
# print "@ranks\n";

   #rank          1        2        3        4       5
     #            0        1        2        3       4 
my @input = qw(Gilligan Skipper Professor Ginger Mary_Ann);
{
  print "@input\n\n";
}
my @sorted_positions = sort { $input[$a] cmp $input[$b] } 0..$#input;
{
  foreach (0..$#sorted_positions) { print "$input[$sorted_positions[$_]] "}
  print "\n\n";
}
my @ranks;
@ranks[@sorted_positions] = (1 .. @sorted_positions);
foreach (0..$#ranks) {
  print "$input[$_] sortes into position $ranks[$_]\n";
}

