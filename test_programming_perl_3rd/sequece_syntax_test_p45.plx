#!/usr/bin/perl -w
use strict;

while (<>) {
  my @time = /(\d+):(\d+):(\d+) (\w+)/;
  print map {$_ . " "} @time, "\n";
}
