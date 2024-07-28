#!/user/bin/perl -w
use strict;

=pod

=head2 Example of Run

  $ perl ch6_pick_position_which_digital_sum_odd.plx
  indices_of_odd_digit_sums: 0 4 5
  odd_digit_sums: 1 16 32

=cut
my @input_numbers = (1, 2, 4, 8, 16, 32, 64);

my @indices_of_odd_digit_sums = grep {
  my $number = $input_numbers[$_];
  my $sum;
  $sum += $_ for split //, $number;
  $sum % 2;
} 0..$#input_numbers;


print "indices_of_odd_digit_sums: @indices_of_odd_digit_sums\n";

my @odd_digit_sums = @input_numbers[ @indices_of_odd_digit_sums ];

print "odd_digit_sums: @odd_digit_sums\n";
