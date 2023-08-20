#!/usr/bin/perl -w
use strict;

=pod

=head1 Requirement_Item_Checking

=head2 Syntax and Example

  $ chmod +x check_requiremet.plx
  $ ./check_requiremet.plx
  skipper is missing water_bottle.
  Adding water_bottle to blue_shirt hat jacket preserver sunscreen for skipper.
  professor is missing preserver.
  professor is missing jacket.
  Adding preserver jacket to sunscreen water_bottle slide_rule batteries radio for professor.


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

my @skipper   = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
check_required_items('skipper', \@skipper);
check_required_items('professor', \@professor);
