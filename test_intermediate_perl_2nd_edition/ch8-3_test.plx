#!/usr/bin/perl -w 
use strict;
use IO::Dir;
my @non_dirs = grep { ! -d } @ARGV;

if(@non_dirs > 0) {
  warn "WARN: It is not a dir: @non_dirs\n";
}

my @dirs = grep { -d } @ARGV;

my @dir_handlers = map { IO::Dir->new($_) or die "Could not open dirhandle! $!\n" } @dirs;

foreach my $df (@dir_handlers) {
  while( defined( my $file = $df->read )) {
	print "I found $file!\n";
  }
}