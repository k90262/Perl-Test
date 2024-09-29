#!/usr/bin/perl -w
use strict;

=pod

=head1 coconet report (order by source server name and destination server name

=head2 Usage Example

  perl ch6-1_updated_coconet_report_program_by_using_storable.plx coconet_6_line.dat
  ginger.girl.hut
    skipper.crew.hut 1511
  laser3.copyroom.hut
    maryann.girl.hut 1127
    professor.hut 6830
  professor.hut
    ginger.girl.hut 3925
  skipper.crew.hut
    maryann.girl.hut 7991
    professor.hut 3476

=cut

my %total_bytes;
while (<>) {
  next if /^#/;
  my ($source, $destination, $byte) = split;
  $total_bytes{$source}{$destination} += $byte;
}

&print_report(\%total_bytes);

sub print_report {
  my $hash_total_bytes = shift; 
  foreach my $source (sort keys %$hash_total_bytes) {
    print "$source\n";
    my $dest_hash = $total_bytes{$source};
    foreach my $dest (sort keys %$dest_hash) {
      print "  $dest $dest_hash->{$dest}\n";
    }
  }
}
