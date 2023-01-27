#!/usr/bin/perl -w
use strict;
use Business::ISBN;

# Usage Sample: 
# perl ch2-3_ans.plx 978-986-276-706-1

my $isbn = Business::ISBN->new( $ARGV[0] );

print "ISBN is         " . $isbn->as_string      . "\n";
print "Country code:   " . $isbn->group_code     . "\n";
print "Publisher cide: " . $isbn->publisher_code . "\n";
