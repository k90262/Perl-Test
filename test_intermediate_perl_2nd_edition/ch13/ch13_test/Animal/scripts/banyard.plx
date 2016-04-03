#!/usr/bin/perl -w
use strict;

use Cow;
use Sheep;
use Mouse;
use Horse;

my @animals = ();

prompt();
while(<STDIN>) {
  chomp;
  if(/Cow|Sheep|Mouse|Horse/) {
    print " * Add " . $_ . "\n";
    push @animals, $_;
    prompt();
  } else {
    foreach my $animal (@animals) {
      $animal->speak();
    }
    last;
  }
}

sub prompt {
  print "Which animal you want to add? (Cow, Sheep, Mouse, or Horse. Or you will leave the program) []:";
}
