#!/usr/bin/perl -w
use strict;

=pod

=head2 Syntax

  perl check_requiremet.plx

=cut

my @required = qw(preserver sunscreen water_bottle jacket);
my %skipper  = map { $_, 1 } 
  qw(blue_shirt hat jacket preserver sunscreen);

foreach my $item (@required) {
  unless ( $skipper{$item} ) { # cannot find in the personal item list
    print "Skipper is missing $item.\n";
  }
}
