#!/usr/bin/perl -w
use strict;

=pod

=head1 ch6_p92_choose_or_modify_more_complexible_data.plx

=head2 Example to Run

  $ perl ch6_p92_choose_or_modify_more_complexible_data.plx
  Ques 1: who's provisions is less than 5 items?
  Ans 1: Gilligan
  Ques 2: who do have a water bottle??
  Ans 2: Gilligan The Professor

=cut

my %provisions = (
  'The Skipper'    => [qw(blue_shirt hat jacket preserver sunscreen)         ],
  'The Professor'  => [qw(sunscreen water_bottle slide_rule batteries radio) ],
  'Gilligan'       => [qw(red_shirt hat lucky_socks water_bottle)            ],
);

my @packed_light = grep @{ $provisions{$_} } < 5, keys %provisions;
print "Ques 1: who's provisions is less than 5 items?\n";
print "Ans 1: @packed_light\n";

my @all_wet = grep {
  my @items = @{ $provisions{$_} };
  grep $_ eq 'water_bottle', @items;
} keys %provisions;

print "Ques 2: who do have a water bottle??\n";
print "Ans 2: @all_wet\n";

print "------Remapped List Ver.------\n";

my @remapped_list = map {
  [ $_ =>  $provisions{$_} ];
} keys %provisions;

#print @remapped_list, "\n";

my @packed_light_list = grep {
  @{ $_->[1] } < 5
} @remapped_list;

@packed_light = map { $_->[0] } @packed_light_list;

print "Ques 1: who's provisions is less than 5 items?\n";
print "Ans 1: @packed_light\n";

my @all_wet_list = grep {
  my @items = @{ $_->[1] };
  grep $_ eq 'water_bottle', @items;
} @remapped_list;
@all_wet = map { $_->[0] } @all_wet_list;

print "Ques 2: who do have a water bottle??\n";
print "Ans 2: @all_wet\n";
