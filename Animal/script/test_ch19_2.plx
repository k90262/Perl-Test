#!/usr/bin/perl -w
use strict;
use RaceHorse;
my $s = RaceHorse->new( name => 'Seattle Slew' );
$s->won;
$s->won;
$s->won;
$s->placed;
$s->lost;
print $s->standings, "\n"; # 3次冠軍, 1次亞軍, 0次季軍, 1次無名次

