#!/usr/bin/perl -w
use strict;

my @skipper 	= qw(blue_shirt hat jackedt preserver sunscreen);
my @professor	= qw(sunscreen water_bottle slide_rule batteries radio);
my @gilligan	= qw(red_shirt hat lucky_socks water_bottle);

my %all = (
	Gilligan 	=> \@gilligan,
	Skipper	 	=> \@skipper,
	Proffessor 	=> \@professor,
);

check_items_for_all(\%all);

sub check_items_for_all {
  my $all = shift;
  for my $person (sort keys %$all) {
    print "Original: $person have @{$all->{$person}}.\n";
    check_required_items($person, $all->{$person});
    print "Result: $person have @{$all->{$person}}.\n\n";
  }
}

sub check_required_items {
  my $who = shift;
  my $items = shift;
  my @required = qw(preserver sunscreen water_bottle jacket);
  my @missing = ();
  for my $item (@required) {
    unless(grep $item eq $_, @$items) {
      print "$who is missing $item.\n";
      push @missing, $item;
    }
  }
  if (@missing) {
     print "Adding @missing to @$items for $who.\n";
     push @$items, @missing;
  }
}
