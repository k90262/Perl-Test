#!/usr/bin/perl -w
use strict;
use My::List::Util qw(sum shuffle);

my @array = 1..10;
#print "\@array = " . \@array . "\n";
my @shuffled = My::List::Util::shuffle(@array);
print "shuffle result: @shuffled\n";
