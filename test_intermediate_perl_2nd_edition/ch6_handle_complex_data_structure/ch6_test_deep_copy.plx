#!/usr/bin/perl -w
use strict;
use Data::Dumper;
use Storable qw(freeze thaw dclone);

=pod

=head1 test deep copy

If any refenrence existed in array and copy array by deep copy, each reference in both array is independency.

=head2 For Example - batteries will be added on both array

  perl ch6_test_deep_copy.plx 
  @provisions = (
                  'hat',
                  'suncreen',
                  [
                    'microscope',
                    'radio'
                  ]
                );
  @packed = (
              'hat',
              'suncreen',
              [
                'microscope',
                'radio',
                'batteries'
              ],
              'blue_shirt'
            );
  
=cut

my @provisions = qw( hat suncreen );
my @science_kit = qw( microscope radio );
push @provisions, \@science_kit;

# shallow copy
#my @packed = @provisions;

# deep copy via freeze and thraw method of Storable
#my $frozen = freeze \@provisions;
#my @packed = @{ thaw $frozen };

# deep copy via dclone method of Storable package
my @packed = @{ dclone \@provisions };

push @packed, 'blue_shirt';

push @{ $packed[2] }, 'batteries';

print Data::Dumper->Dump(
  [ \@provisions ],
  [ qw( *provisions ) ]
); 

print Data::Dumper->Dump(
  [ \@packed ],
  [ qw( *packed ) ]
); 
