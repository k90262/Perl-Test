#!/usr/bin/perl -w
use strict;
use JSON;

=pod

=head1 coconet report (order by source server name and destination server name

=head2 Usage Example

  $ perl ch6-2_updated_coconet_report_program_by_using_JSON.plx coconet_6_line.dat
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
  $ cat ch6-2_total_report.json 
  [
     {
        "ginger.girl.hut" : {
           "skipper.crew.hut" : 1511
        },
        "professor.hut" : {
           "ginger.girl.hut" : 3925
        },
        "skipper.crew.hut" : {
           "maryann.girl.hut" : 7991,
           "professor.hut" : 3476
        },
        "laser3.copyroom.hut" : {
           "maryann.girl.hut" : 1127,
           "professor.hut" : 6830
        }
     }
  ]

=head2 Reference

  $ perldoc JSON

=cut

my $_report_filename = "ch6-2_total_report.json";
my %_total_bytes;
my $_json = JSON->new->allow_nonref;

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
    local $/;
    open my $fh, '<:raw', $_report_filename;
    my $json_text = <$fh>;
    my $array_ref = $_json->decode( $json_text );
    %_total_bytes = %{ $array_ref->[0] };  
  }
}

sub save_report {
  open my $fh, '>:utf8', $_report_filename;
  my $json_text = $_json->pretty->encode( [\%_total_bytes] );
  print $fh $json_text;
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
