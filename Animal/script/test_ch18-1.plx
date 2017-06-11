#!/usr/bin/perl -w
use strict;
use RaceHorse;

my $runner = RaceHorse->named('Billy Boy');
$runner->won;
print $runner->name, ' has standings ', $runner->standings, ".\n";
