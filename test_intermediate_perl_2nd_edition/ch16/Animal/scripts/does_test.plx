#!/usr/bin/perl -w
use strict;

use v5.10;
use Horse;

if (Horse->DOES('Animal')) {
  print "A Horse is an Animal.\n";
}

my $tv_horse = Horse->named("Mr. Ed");
if ($tv_horse->DOES('Animal')) {	# 是Animal的一員嗎？
  print $tv_horse->name, "is an Animal.\n";
  if ($tv_horse->DOES("Horse")) {	# 是Horse的一員嗎？
    print 'In fact, ', $tv_horse->name, " is a Horse.\n";
  } else {
    print "...but it's not a Horse.\n";
  }
}

sub UNIVERSAL::fandango {
  warn 'object ', shift, " can do the fandango!";
}

$tv_horse->fandango;
