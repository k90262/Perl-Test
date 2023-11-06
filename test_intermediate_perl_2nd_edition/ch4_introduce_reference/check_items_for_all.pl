#!/usr/bin/perl
use strict;
use warnings;
do './check_required_items.pl';

=pod

=head1 check_items_for_all 

=head2 Syntax

  $ perl ./check_items_for_all.pl
  Gilligan is missing preserver.
  Gilligan is missing sunscreen.
  Gilligan is missing jacket.
  Adding preserver sunscreen jacket to red_shirt hat lucky_socks water_bottle for Gilligan.
  Professor is missing preserver.
  Professor is missing jacket.
  Adding preserver jacket to sunscreen water_bottle slide_rule batteries radio for Professor.
  Skipper is missing water_bottle.
  Adding water_bottle to blue_shirt hat jacket preserver sunscreen for Skipper.

=cut

my @skipper   = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @gilligan  = qw(red_shirt hat lucky_socks water_bottle);

my %all = (
	Gilligan  => \@gilligan, 
	Skipper   => \@skipper, 
	Professor => \@professor,
);

check_items_for_all(\%all);

sub check_items_for_all {
  my $all = shift;
  for my $person (sort keys %$all) {
    &check_required_items($person, $all->{$person});
  }
}
