#!/usr/bin/perl -w 
use strict;
#require 'Oogaboogoo/Date.pm';
use Oogaboogoo::Date qw(:all);

my($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;

#my $day_name = Oogaboogoo::Date::day($wday);
#my $mon_name = Oogaboogoo::Date::mon($mon);
my $day_name = day($wday);
my $mon_name = mon($mon);

$year += 1900;

print "Today is $day_name, $mon_name $mday, $year.\n";
