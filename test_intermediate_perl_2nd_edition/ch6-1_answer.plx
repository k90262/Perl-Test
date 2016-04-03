#!/usr/bin/perl -w
use strict;
#use Storable qw(nstore retrieve freeze thaw dclone);
use Storable;

my $all = "**all machines**";
my $data_file = "ch6-1_total_bytes.data";

my %total_bytes;
if( -e $data_file ) {
	my $data = retrieve $data_file;
	%total_bytes = %$data;
}

while(<>) {
  next if /^#/;
  my($source, $destination, $bytes) = split;
  
  $total_bytes{$source}{$destination} += $bytes;
  $total_bytes{$source}{$all} 		+= $bytes;
}

store \%total_bytes, $data_file;
 
for my $s ( sort {$total_bytes{$b}{$all} <=> $total_bytes{$a}{$all}} keys %total_bytes) {
  #print "$s " . $server_data{$s}{$all} . "\n";
  for my $d ( sort {$total_bytes{$s}{$b} <=> $total_bytes{$s}{$a}} keys $total_bytes{$s}) {
	next if $d eq $all;
	print $s, " => ", $d, ": ", $total_bytes{$s}{$d}, "\n";
  }
}
#print "\n";