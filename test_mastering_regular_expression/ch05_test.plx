#!/usr/bin/perl
use strict;
#use re debug;

=pod

=head2 Syntax

  perl ch05_test.plx sample_keep_nextline_.txt

=cut

our $/ = undef;
my $file = <>;

print $file, "\n"; 

if ($file =~ m/^\w+=[^\n\\]*(\\\n[^\n\\]*)*/) { # cannot match any backslash existd in non-tail positions
  print "regex matched: \$&: $&\n";
}

if ($file =~ m/^\w+=([^\n\\]|\\.)*/s) {
  print "regex matched: \$&: $&\n";
}
