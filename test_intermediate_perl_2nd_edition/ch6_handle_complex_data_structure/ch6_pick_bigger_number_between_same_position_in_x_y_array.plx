#!/usr/bin/perl -w
use strict;
=pod

=head2 Example of Run

  $ perl ch6_pick_bigger_number_between_same_position_in_x_y_array.plx
  bigger: 7 9

=cut
my @x = (1, 3, 7, 9);
my @y = (2, 4, 6);

# my @bigger_indices = grep {
#   if ($_ > $#y or $x[$_] > $y[$_]) {
#     1; # pickup
#   }
#   else {
#     0; # dont't pickup
#   }
# } 0..$#x;
# my @bigger = @x[@bigger_indices];

# OR
# my @bigger_indices = grep {
#   $_ > $#y or $x[$_] > $y[$_]
# } 0..$#x;
# my @bigger = @x[@bigger_indices];

# OR
my @bigger = map {
  if ($_ > $#y or $x[$_] > $y[$_]) {
    $x[$_];
  } else {
   ();
  }
} 0..$#x;

# expected: 7, 9
print "bigger: @bigger\n";

