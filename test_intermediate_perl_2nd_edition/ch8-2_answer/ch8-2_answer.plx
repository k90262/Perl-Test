#!/usr/bin/perl -w
use strict;

my %output_handles;

while(<>) {
  unless (/^([^:]+):/) {
    warn "ignoring the line with missing name: $_";
	next;
  }
  my $name = lc $1;
  unless ( $output_handles{$name} ) {
    open my $fh, '>', "$name.info"
	  or die "Cannot create $name.info: $!";
	$output_handles{$name} = $fh;
  }
  
  print { $output_handles{$name} } $_;
}