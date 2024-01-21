#!/usr/bin/perl -w
use strict;
use Data::Dumper;

=pod

=head1 bytecounts (test Data::Dumper)

=head2 Usage Example

=head3 Case 1: print Dumper(\@data1, \@data2);

  $ perl ch6_test_data_dump_with_data_share.pl
  $VAR1 = [
            'one',
            'won',
            [
              'two',
              'too',
              'to',
              []
            ]
          ];
  $VAR1->[2][3] = $VAR1;
  $VAR2 = $VAR1->[2];

=head3 Case 2: print Data::Dumper->Dump([...], qw(...));

  perl ch6_test_data_dump_with_data_share.pl
  @data1 = (
             'one',
             'won',
             [
               'two',
               'too',
               'to',
               []
             ]
           );
  $data1[2][3] = \@data1;
  @data2 = @{$data1[2]};

=cut

$Data::Dumper::Purity = 1; # declare data structure may self-reference.
my @data1 = qw(one won);
my @data2 = qw(two too to);
push @data2, \@data1;
push @data1, \@data2;
#print Dumper(\@data1, \@data2);

print Data::Dumper->Dump(
  [\@data1, \@data2],
  [qw(*data1 *data2)]
);


