#!/usr/bin/perl -w
use strict;
use File::Find;

sub print_big_than {
  my $minimum_size = shift;
  return sub { print "$File::Find::name\n" if -f and -s >= $minimum_size };
}

my $bigger_than_1024 = print_big_than(1024);
find($bigger_than_1024, 'bin');
