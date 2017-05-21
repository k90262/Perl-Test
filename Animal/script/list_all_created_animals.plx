#!/usr/bin/perl -w
use strict;
use Cow;
use Horse;
use RaceHorse;

{
  my @cows = map Cow->named($_), qw(Bessie Gwen);
  my @horses = map Horse->named($_), ('Trigger', 'Mr. Ed');
  my @racehorses = RaceHorse->named('Billy Boy');
}
print "We've seen:\n", map("  $_\n", Animal->registered);
print "End of program.\n";
