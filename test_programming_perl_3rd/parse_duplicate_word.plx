#!/usr/bin/perl -w
use strict;

my @all;

$/ = "";
while (<>) {
  push @all, $_;
  while ( m{
      \b
      (\w\S+)
      (
        \s+
        \1
      )+
      \b 
    }xig
  ) 
  {
    print "dup word '$1' at paragraph $.\n";
  }
}

print "===All Text===\n";
print @all, "\n";
print "==============\n";
