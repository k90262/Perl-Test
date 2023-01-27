#!/usr/bin/perl -w
use strict;
use Business::ISBN;

my $isbn_num = '978-986-276-706-1';

my $isbn = Business::ISBN->new($isbn_num);
print "ISBN:           ", $isbn->as_string, "\n";
print "group code:     ", $isbn->group_code , "\n";
print "publisher code: ", $isbn->publisher_code, "\n";
