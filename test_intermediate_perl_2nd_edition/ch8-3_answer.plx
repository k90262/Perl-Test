#!/usr/bin/perl -w
use strict;

my @not_dirs = grep { ! -d } @ARGV;
foreach my $not_dir ( @not_dirs ) {
  print "$not_dir is not a directory!\n";
}

my @dirs = grep { -d } @ARGV;

my @dir_hs = map { opendir my $dh, $_; $dh } grep { -d } @ARGV;

foreach my $dh ( @dir_hs ) { print_contents( $dh ) };

sub print_contents {
  my $dh = shift;
  
  while( my $file = readdir $dh ) {
    next if( $file eq '.' or $file eq '..');
	print "$file\n";
  }
};

