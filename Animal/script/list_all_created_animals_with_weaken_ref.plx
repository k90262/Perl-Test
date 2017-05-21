#!/usr/bin/perl -w
use strict;
use Horse;
use Animal;
use Cow;
use RaceHorse;

my @horese = map Horse->named($_), ('Trigger', 'Mr. Ed');
print "alive before block:\n", map("  $_\n", Animal->registered);
{
  my @cows = map Cow->named($_), qw(Bessie, Gwen);
  my @racehorses = RaceHorse->named('Billy Boy');
  print "alive inside block:\n", map("  $_\n", Animal->registered);
}
print "alive after block:\n", map("  $_\n", Animal->registered);
print "End of program.\n";
