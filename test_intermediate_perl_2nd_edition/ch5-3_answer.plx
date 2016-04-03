#!/usr/bin/perl -w
use strict;

my %total_bytes;
while (<>) {
  my ($source, $destination, $bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
}

foreach my $source ( sort keys %total_bytes ) {
  print "$source\n";
  my $dest_hash = $total_bytes{$source};
  foreach my $dest ( sort keys %$dest_hash ) {
    print " $dest $dest_hash->{$dest}\n";
  }
}

