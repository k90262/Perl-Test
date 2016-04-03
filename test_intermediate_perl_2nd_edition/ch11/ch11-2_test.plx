#!/usr/bin/perl -w
use strict;

my $now_time = time;
my $now_string = localtime($now_time);
print "$now_string\n";

require 'Oogaboogoo/Date.pm';
my($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($now_time);
$year += 1900;
print "Today is ", Oogaboogoo::Date::day($wday), " ", Oogaboogoo::Date::mon($mon), " $mday $year\n";
