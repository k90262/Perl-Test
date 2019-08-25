#!/usr/bin/perl -w
use strict;

while (<STDIN>) {
  if (/^\d+$/) { # 123456
    my $pop = $_;
    $pop =~ s|(?<=\d)(?=(\d\d\d)+$)|,|g;
    print "The US population is $pop"; # 123,456
  }
}
