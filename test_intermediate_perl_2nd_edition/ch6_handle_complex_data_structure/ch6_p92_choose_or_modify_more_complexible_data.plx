#!/usr/bin/perl -w
use strict;

=pod

=head1 ch6_p92_choose_or_modify_more_complexible_data.plx

=head2 Example to Run

  $ perl ch6_p92_choose_or_modify_more_complexible_data.plx
  Ques 1: who's provisions is less than 5 items?
  Ans 1: Gilligan

=cut

my %provisions = (
  'The Skipper'    => [qw(blue_shirt hat jacket preserver sunscreen)         ],
  'The Professor'  => [qw(sunscreen water_bottle slide_rule batteries radio) ],
  'Gilligan'       => [qw(red_shirt hat lucky_socks water_bottle)            ],
);

my @packed_light = grep @{ $provisions{$_} } < 5, keys %provisions;
print "Ques 1: who's provisions is less than 5 items?\n";
print "Ans 1: @packed_light\n";
