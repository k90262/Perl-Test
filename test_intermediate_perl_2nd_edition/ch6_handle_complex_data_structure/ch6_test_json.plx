#!/usr/bin/perl -w
use strict;
use JSON;

=pod

=head1 test JSON dump

=head2 Prerequisit

Install JSON module

=head3 For instance:

  $ cpanm install JSON

=head2 Example Usage

  $ perl ch6_test_json.plx < coconet_6_line.dat
  ---
  {
     "laser3.copyroom.hut" : {
        "professor.hut" : 6830,
        "maryann.girl.hut" : 1127
     },
     "ginger.girl.hut" : {
        "skipper.crew.hut" : 1511
     },
     "skipper.crew.hut" : {
        "professor.hut" : 3476,
        "maryann.girl.hut" : 7991
     },
     "professor.hut" : {
        "ginger.girl.hut" : 3925
     }
  }

  6830

=cut

my %total_bytes;

while (<>) {
  my ($source, $destination, $bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
}

# to_json
my $json_string = to_json(\%total_bytes, { pretty => 1 });
print $json_string, "\n";

# from_json
my $hash_ref = from_json( $json_string );
print $hash_ref->{"laser3.copyroom.hut"}->{"professor.hut"}, "\n";


