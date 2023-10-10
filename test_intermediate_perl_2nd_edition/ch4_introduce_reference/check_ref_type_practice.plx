#!/usr/bin/perl -w
use strict;
use Carp qw(croak);
use Scalar::Util qw(reftype);
use constant HASH => ref {};

=pod

=head1 usage and output

  $ perl check_ref_type_practice.plx
  Not a HASH reference at check_ref_type_practice.plx line 11.

=cut

my %hash = (1 => 'a', 2 => 'b');
my @array = qw(1 2 3 4);

show_hash( \%hash );
show_hash( \@array );

sub show_hash {
  my $hash_ref = shift;
  my $ref_type = reftype $hash_ref; # worked for object
  croak "I expected a hash reference!" 
    unless $ref_type eq HASH;
  
  foreach my $key ( keys %$hash_ref ) {
    print "key: $key\n";
  }
}
