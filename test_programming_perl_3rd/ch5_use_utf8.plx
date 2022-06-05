#!/usr/bin/perl -w
use strict;
use utf8;
use charnames qw/:full/;
my @BMV;
$BMV[887] = "G\N{MUSIC SHARP SIGN} minor";
my($note, $black, $mode) = $BMV[887] =~ /^([A-G])(.)\s+(\S+)/;
print "That's lookin' sharp!\n" if $black eq chr(9839);
print "-----Bill Test------\n";
print "$BMV[887]\n";
