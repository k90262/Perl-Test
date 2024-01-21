#!/usr/bin/perl -w
use strict;
use Data::Dumper;

=pod

=head1 bytecounts (test Data::Dumper)

=head2 Usage Example

=head3 Case 1. print Dumper(\%total_bytes);

  $ perl ch6_test_data_dump.pl < coconet_6_line.dat
  $VAR1 = {
            'ginger.girl.hut' => {
                                   'skipper.crew.hut' => 1511
                                 },
            'professor.hut' => {
                                 'ginger.girl.hut' => 3925
                               },
            'skipper.crew.hut' => {
                                    'professor.hut' => 3476,
                                    'maryann.girl.hut' => 7991
                                  },
            'laser3.copyroom.hut' => {
                                       'maryann.girl.hut' => 1127,
                                       'professor.hut' => 6830
                                     }
          };

=head3 Case 2. print Data::Dumper->Dump([\%total_bytes], [qw(*total_bytes)]);

  $ perl ch6_test_data_dump.pl < coconet_6_line.dat
  %total_bytes = (
                   'professor.hut' => {
                                        'ginger.girl.hut' => 3925
                                      },
                   'ginger.girl.hut' => {
                                          'skipper.crew.hut' => 1511
                                        },
                   'laser3.copyroom.hut' => {
                                              'professor.hut' => 6830,
                                              'maryann.girl.hut' => 1127
                                            },
                   'skipper.crew.hut' => {
                                           'professor.hut' => 3476,
                                           'maryann.girl.hut' => 7991
                                         }
                 );

=cut

my %total_bytes;
while (<>) {
  next if /^#/;
  my ($source, $destination, $byte) = split;
  $total_bytes{$source}{$destination} += $byte;
}

#foreach my $source (sort keys %total_bytes) {
#  print "$source\n";
#  my $dest_hash = $total_bytes{$source};
#  foreach my $dest (sort keys %$dest_hash) {
#    print "  $dest $dest_hash->{$dest}\n";
#  }
#}

#print Dumper(\%total_bytes); 
print Data::Dumper->Dump([\%total_bytes], [qw(*total_bytes)]); 
