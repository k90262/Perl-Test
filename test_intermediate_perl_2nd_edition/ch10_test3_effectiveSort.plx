#!/usr/bin/perl -w
use strict;

my @castaways =
  qw(Gilligan Skipper Professor Ginger Mary Ann Thurston Lovey);
# NEED ASKING MONKEY TOO MANY TIMES...MONKEY WILL ANGRY!!
# my @wasters = sort {
#   ask_monkey_about($b) <=> ask_monkey_about($a)
# } @castaways;

my @names_and_pineapples = map {
  [ $_, ask_monkey_about($_) ]
} @castaways;

my @sorted_names_and_pineapples = sort {
  $b->[1] <=> $a->[1];
} @names_and_pineapples;

my @names = map $_->[0], @sorted_names_and_pineapples;
my @wasters = @names;



print "castaways: @castaways\n";
print "waters:    @wasters\n";



sub ask_monkey_about {
  my $name = shift @_;

  my %hash_name_number = (
    'Gilligan'	=>1,
    'Skipper'	=>2,
    'Professor'	=>3,
    'Ginger'	=>4,
    'Mary'	=>5,
    'Ann'	=>6,
    'Thurston'	=>7,
    'Lovey'	=>8
  );

  return $hash_name_number{$name};
}
