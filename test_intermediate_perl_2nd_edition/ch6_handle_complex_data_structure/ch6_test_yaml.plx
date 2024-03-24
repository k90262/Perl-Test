#!/usr/bin/perl -w
use strict;
use YAML;

=pod

=head1 test YAML dump

=head2 Prerequisit

Install YAML module

=head3 For instance:

  $ cpanm install YAML

=head2 Example Usage

  $ perl ch6_test_yaml.plx < coconet_6_line.dat
  ---
  ginger.girl.hut:
    skipper.crew.hut: 1511
  laser3.copyroom.hut:
    maryann.girl.hut: 1127
    professor.hut: 6830
  professor.hut:
    ginger.girl.hut: 3925
  skipper.crew.hut:
    maryann.girl.hut: 7991
    professor.hut: 3476

=cut

my %total_bytes;

while (<>) {
  my ($source, $destination, $bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
}

print Dump(\%total_bytes);
