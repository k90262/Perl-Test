#!/usr/bin/perl -w
use strict;

=pod

=head1 Requirement_Item_Checking

=head2 Syntax and Example

  $ chmod +x check_requiremet.plx
  $ ./check_requiremet.plx
  skipper is missing water_bottle.
  professor is missing preserver.
  professor is missing jacket.


=cut

sub check_required_items {
  my $who = shift;
  my %who_items  = map { $_, 1 } @_; # other arguments are this user's personal items

  my @required = qw(preserver sunscreen water_bottle jacket);
  
  foreach my $item (@required) {
    unless ( $who_items{$item} ) { # cannot find in the personal item list
      print "$who is missing $item.\n";
    }
  }
}

my @skipper   = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
check_required_items('skipper', @skipper);
check_required_items('professor', @professor);
