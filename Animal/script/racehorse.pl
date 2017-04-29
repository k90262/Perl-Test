#!/usr/bin/perl -w
use strict;
use RaceHorse;
my $racer = RaceHorse->named('Billy Boy');
# 出賽紀錄：3次冠軍, 1次季軍, 1次無名次
$racer->won;
$racer->won;
$racer->won;
$racer->showed;
$racer->lost;
print $racer->name, ' has standings of ', $racer->standings, ".\n";

