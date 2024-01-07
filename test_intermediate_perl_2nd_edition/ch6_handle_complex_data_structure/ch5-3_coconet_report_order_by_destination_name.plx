#!/usr/bin/perl -w
use strict;

=pod

=head1 coconet report (order by source server name and destination server name

=head2 Usage Example

  $ perl ch5-3_coconet_report_order_by_destination_name.plx coconet.dat 
  fileserver.copyroom.hut
   fileserver.copyroom.hut 1035063
   gilligan.crew.hut 1003063
   ginger.girl.hut 1025905
   laser3.copyroom.hut 1038896
   maryann.girl.hut 1118220
   professor.hut 1044010
   skipper.crew.hut 1096333
  gilligan.crew.hut
   fileserver.copyroom.hut 1017164
   gilligan.crew.hut 1064752
   ginger.girl.hut 1012972
   laser3.copyroom.hut 970637
   maryann.girl.hut 969364
   professor.hut 883070
   skipper.crew.hut 1126620
  ginger.girl.hut

=cut

my %total_bytes;
while (<>) {
  next if /^#/;
  my ($source, $destination, $byte) = split;
  $total_bytes{$source}{$destination} += $byte;
}

foreach my $source (sort keys %total_bytes) {
  print "$source\n";
  my $dest_hash = $total_bytes{$source};
  foreach my $dest (sort keys %$dest_hash) {
    print "  $dest $dest_hash->{$dest}\n";
  }
}
