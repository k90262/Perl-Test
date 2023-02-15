#!/usr/bin/perl -w
use strict;

my $header_width = length "double_output_result: ";

sub b_say {
  my ($item, @result) = @_;
  printf "%*s %s\n", $header_width, "$item", join(", ", @result);
}

my @input_numbers = (1, 2, 4, 8, 16, 32, 64);
my @result = map $_ + 100, @input_numbers;
b_say("input_numbers: ", @input_numbers);
b_say("result: "       , @result);

my @double_output_result = map { $_, 3 * $_} @input_numbers;
b_say("double_output_result: ", @double_output_result);
