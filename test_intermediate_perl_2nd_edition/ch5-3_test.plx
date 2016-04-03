#!/usr/bin/perl -w
use strict;

my $all = "**all machines**";

my %total_bytes;
while(<>) {
	next if /^#/;
	my ($source, $destination, $bytes) = split;
	$total_bytes{$source}{$destination} += $bytes;
	$total_bytes{$source}{$all} += $bytes;
}

my @sources = 
	sort keys %total_bytes;
	
for my $source (@sources) {
	print "$source\n";
	my @destinations = 
		sort keys %{ $total_bytes{$source} };
	for my $destination (@destinations) {
		next if $destination eq $all;
		print "  $destination:",
			" $total_bytes{$source}{$destination}\n";
	}
	#print "\n";
}