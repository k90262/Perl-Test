#!/usr/bin/perl -w
use strict;
use Storable qw(nstore retrieve);

=pod

=head1 coconet report (order by source server name and destination server name

=head2 Usage Example

  $ perl ch6-1_updated_coconet_report_program_by_using_storable.plx coconet_6_line.dat
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

  $ ll ch6-1_total_report.bin
  -rw-r--r--  1 apple  staff   263B 10  7 01:01 ch6-1_total_report.bin

=cut

my $_report_filename = "ch6-1_total_report.bin";
my %_total_bytes;

&load_report();

while (<>) {
  next if /^#/;
  my ($source, $destination, $byte) = split;
  $_total_bytes{$source}{$destination} += $byte;
}

&save_report();

&print_report();


sub load_report {
  if (-e $_report_filename) {
    my $array_ref = retrieve $_report_filename;
    %_total_bytes = %{ $array_ref->[0] };  
  }
}

sub save_report {
  nstore [\%_total_bytes], $_report_filename;
}

sub print_report {
  foreach my $source (sort keys %_total_bytes) {
    print "$source\n";
    my $dest_hash = $_total_bytes{$source};
    foreach my $dest (sort keys %$dest_hash) {
      print "  $dest $dest_hash->{$dest}\n";
    }
  }
}
