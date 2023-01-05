#!/usr/bin/perl -w
use strict;
use Cwd;
use File::Spec;

my $cwd = getcwd;

foreach my $file ( glob(".* *") ) {
  print "    ", File::Spec->catfile($cwd, $file ), "\n";
}
