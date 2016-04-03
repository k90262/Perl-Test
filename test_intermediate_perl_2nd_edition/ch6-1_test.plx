#!/usr/bin/perl -w
use strict;
use Storable qw(nstore retrieve freeze thaw dclone);

my $filename = "ch6-1_test.data";
my $all = "sub total";
my $server_data = {};

if( -e $filename ) {
	$server_data = retrieve $filename;
}

while(<>) {
  next if /^\s*#/;
  my($source, $destination, $troughput) = split;
  #print $source;
  $server_data->{$source}{$destination} += $troughput;
  $server_data->{$source}{$all} += $troughput;
  #print '$server_data{',$source,'}{',$destination,'} = ', $troughput, "\n";
}

nstore $server_data, $filename;
 
for my $s ( sort {$server_data->{$b}{$all} <=> $server_data->{$a}{$all}} keys %$server_data) {
  #print "$s " . $server_data{$s}{$all} . "\n";
  for my $d ( sort {$server_data->{$s}{$b} <=> $server_data->{$s}{$a}} keys $server_data->{$s}) {
	next if $d eq $all;
	print $s, " => ", $d, ": ", $server_data->{$s}{$d}, "\n";
  }
}
#print "\n";