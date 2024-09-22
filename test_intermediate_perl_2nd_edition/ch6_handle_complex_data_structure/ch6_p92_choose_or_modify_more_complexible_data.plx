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
  ------Remapped List Ver.------
  Ques 1: who's provisions is less than 5 items?
  Ans 1: Gilligan 
  Ques 2: who do have a water bottle??
  Ans 2: Gilligan The Professor
  ------Remapped as an array------
  Ques 1: who's provisions is less than 5 items?
  Ans 1: Gilligan 
  Ques 2: who do have a water bottle??
  Ans 2: Gilligan The Professor@all_wet = map { $_->[0] } @all_wet_list;

=cut

my %provisions = (
  'The Skipper'    => [qw(blue_shirt hat jacket preserver sunscreen)         ],
  'The Professor'  => [qw(sunscreen water_bottle slide_rule batteries radio) ],
  'Gilligan'       => [qw(red_shirt hat lucky_socks water_bottle)            ],
);

my @packed_light = grep @{ $provisions{$_} } < 5, keys %provisions;

sub ques_and_ans_1 {
  print "Ques 1: who's provisions is less than 5 items?\n";
  print "Ans 1: @{ shift @_ } \n";
}
&ques_and_ans_1(\@packed_light);

my @all_wet = grep {
  my @items = @{ $provisions{$_} };
  grep $_ eq 'water_bottle', @items;
} keys %provisions;

sub ques_and_ans_2 {
  print "Ques 2: who do have a water bottle??\n";
  print "Ans 2: @{ shift @_ }\n";
}
&ques_and_ans_2(\@all_wet);

print "------Remapped List Ver.------\n";

my @remapped_list = map {
  [ $_ =>  $provisions{$_} ];
} keys %provisions;
#print @remapped_list, "\n";

my @packed_light_list = grep {
  @{ $_->[1] } < 5
} @remapped_list;

@packed_light = map { $_->[0] } @packed_light_list;

&ques_and_ans_1(\@packed_light);

my @all_wet_list = grep {
  my @items = @{ $_->[1] };
  grep $_ eq 'water_bottle', @items;
} @remapped_list;
@all_wet = map { $_->[0] } @all_wet_list;

&ques_and_ans_2(\@all_wet);

print "------Remapped as an array------\n";

my @person_item_pairs = map {
  my $person = $_;
  my @items = @{ $provisions{$person} };
  map [$person => $_], @items;
} keys %provisions;

@packed_light = grep {
  my $person = $_;
  my @items = grep $_->[0] eq $person, @person_item_pairs;
  @items < 5;
} keys %provisions;

&ques_and_ans_1(\@packed_light);

@all_wet = grep {
  my $person = $_;
  my @items = grep $_->[0] eq $person && $_->[1] eq 'water_bottle', @person_item_pairs;
  @items >= 1;
} keys %provisions;

&ques_and_ans_2(\@all_wet);
