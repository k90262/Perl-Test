#!/usr/bin/perl -w
use strict;

use MyDate;

my $mydate = MyDate->new;
print "y m d: " . $mydate->year . " " .  $mydate->month . " " .  $mydate->day, "\n";
