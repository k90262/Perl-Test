#!/usr/bin/perl -w
use strict;

=pod

=head1 Requirement_Item_Checking

=head2 Syntax and Example

  $ chmod +x check_requiremet.plx
  $ ./check_requiremet.plx
  Skipper is missing water_bottle.
  Adding water_bottle to blue_shirt hat jacket preserver sunscreen for Skipper.
  Professor is missing preserver.
  Professor is missing jacket.
  Adding preserver jacket to sunscreen water_bottle slide_rule batteries radio for Professor.
  Gilligan is missing preserver.
  Gilligan is missing sunscreen.
  Gilligan is missing jacket.
  Adding preserver sunscreen jacket to red_shirt hat lucky_socks water_bottle for Gilligan.


=cut

sub check_required_items {
  my $who   = shift;
  my $items = shift;

  my %who_items  = map { $_, 1 } @$items; # other arguments are this user's personal items

  my @required = qw(preserver sunscreen water_bottle jacket);
  my @missing = ();

  foreach my $item (@required) {
    unless ( $who_items{$item} ) { # cannot find in the personal item list
      print "$who is missing $item.\n";
      push @missing, $item;
    }
  }

  if (@missing) {
    print "Adding @missing to @$items for $who.\n";
    push @$items, @missing;
  }
}

# Arrange
my @skipper   = qw(blue_shirt hat jacket preserver sunscreen);
my @skipper_with_name = ('Skipper' => \@skipper);

my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @professor_with_name = ('Professor' =>  \@professor);

my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
my @gilligan_with_name = ('Gilligan', \@gilligan);

my @all_with_names = (
  \@skipper_with_name,
  \@professor_with_name,
  \@gilligan_with_name,
);

# Act
for my $person (@all_with_names) {
  my $who = $$person[0];
  my $provisions_reference = $$person[1];
  check_required_items($who, $provisions_reference);
}
