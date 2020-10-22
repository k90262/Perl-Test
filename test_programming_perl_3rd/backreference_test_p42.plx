#!/usr/bin/perl -w
use strict;

####
#
# perl backreference_test_p42.plx html_tag_test.txt 
#
###
while(<>) {
  chomp;
  print "read $_ ...\n";
  if (/<(.*?)>.*?<(\/\1)>/) {
    print " => " . $_ . " is matched the patten of " . '<(.*?)>.*?<(\/\1)>' . "\n";
  }
  elsif (s/(\S+)\s+(\S+)/$2 $1/){
    print " => " . $_ . " is the result of " . 's/(\S+)\s+(\S+)/$2 $1/' . "\n";
  }
}
