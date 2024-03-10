#!/usr/bin/perl -w
use strict;
use Data::Dumper;

=pod

=head1 test shallow copy issue

If any refenrence existed in array and copy array  by shallow copy, then the reference in both of new and old array are the same one. (Content of this reference will be updated at both of new and old array once this content has bee changed)

=head2 For Example - batteries will be added on both array

  perl ch6_test_shallow_copy.plx
  @provisions = (
                  'hat',
                  'suncreen',
                  [
                    'microscope',
                    'radio',
                    'batteries'
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

my @packed = @provisions;

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
