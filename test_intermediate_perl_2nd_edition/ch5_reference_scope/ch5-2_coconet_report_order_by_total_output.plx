#!/usr/bin/perl -w
use strict;

=pod

=head1 coconet report (order by total destintation throughput)

=head2 Usage Example

  $ perl ch5-2_coconet_report_order_by_total_output.plx coconet.dat
  gilligan.crew.hut: 7044579 total bytes sent
    gilligan.crew.hut => skipper.crew.hut: 1126620 bytes
    gilligan.crew.hut => gilligan.crew.hut: 1064752 bytes
    gilligan.crew.hut => fileserver.copyroom.hut: 1017164 bytes
    gilligan.crew.hut => ginger.girl.hut: 1012972 bytes
    gilligan.crew.hut => laser3.copyroom.hut: 970637 bytes
    gilligan.crew.hut => maryann.girl.hut: 969364 bytes
    gilligan.crew.hut => professor.hut: 883070 bytes
  
  professor.hut: 7352334 total bytes sent
    professor.hut => maryann.girl.hut: 1124757 bytes
    professor.hut => professor.hut: 1094460 bytes
    professor.hut => skipper.crew.hut: 1080344 bytes
    professor.hut => ginger.girl.hut: 1077569 bytes
    professor.hut => laser3.copyroom.hut: 1040771 bytes
    professor.hut => gilligan.crew.hut: 1018747 bytes
    professor.hut => fileserver.copyroom.hut: 915686 bytes
  ...

=cut

my $all = '** all machines **';

my %total_bytes;
while(<>) {
  next if /^#/;
  my ($source, $destination, $bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
  $total_bytes{$source}{$all} += $bytes;
}

my @sources = 
  sort { $total_bytes{$b}{$all} <=> $total_bytes{$b}{$all} }
  keys %total_bytes;

for my $source (@sources) {
  my $tb = $total_bytes{$source};
  my @destinations = sort { $tb->{$b} <=> $tb->{$a} } keys %$tb;
  print "$source: $tb->{$all} total bytes sent\n";
  for my $destination (@destinations) {
    next if $destination eq $all;
    print "  $source => $destination: $tb->{$destination} bytes\n";
  }
  print "\n";
} 
