#!/usr/bin/perl -w
use strict;

chdir;

while(1) {
  print "please enter the pattern to find your file: ";
  chomp(my $enterPattern = <STDIN>);
  last unless (defined $enterPattern && length $enterPattern);

   map {print "   $_\n";} 
   grep {eval '/$enterPattern/'} 
   glob "* .*";

   warn "呱呱！警告：$@" if $@; 
}
