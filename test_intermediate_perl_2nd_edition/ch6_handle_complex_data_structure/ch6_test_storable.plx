#!/usr/bin/perl -w
use strict;
use Storable qw(freeze thaw nstore retrieve);

=pod

=head1 test Storable to save complex data structure

=head2 Usage Example

  $ perl ch6_test_storable.plx 
  one
  one

=head2 Output File (binary string)

nstore.output

=cut

my @data1 = qw(one won);
my @data2 = qw(two too to);
push @data2, \@data1;
push @data1, \@data2;

#
# Storable::freeze
#
my $frozen = freeze [\@data1, \@data2];
#print $frozen;

#
# Storable::thaw
#
my $input = $frozen;
my $data = thaw( $input );
print $data->[0]->[0], "\n";

#
# Storable::nstore
#
my $filename = 'nstore.output';
nstore [\@data1, \@data2], $filename;

#
# Storable::retrieve
#
my $array_ref = retrieve $filename;
print $array_ref->[0]->[0], "\n";
