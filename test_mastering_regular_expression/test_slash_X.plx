#!/usr/bin/perl -w
use strict;

while(<>) {
  if (/ab\Xc/) {
    print $_;
  }
  if (/ab\wc/) {
    print $_;
  }
  if (/ab.c/) {
    print $_;
  }

}
