#!/usr/bin/perl -w
use strict;

=pod

=head1 usage and output

  $ perl check_ref_type_practice.plx
  Not a HASH reference at check_ref_type_practice.plx line 11.

=cut

my @array = qw(1 2 3 4);

show_hash( \@array );

sub show_hash {
  my $hash_ref = shift;
  
  foreach my $key ( keys %$hash_ref ) {
    print "key: $key\n";
  }
}
