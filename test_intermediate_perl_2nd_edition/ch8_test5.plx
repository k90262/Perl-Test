#!/usr/bin/perl -w
use strict;

# opendir my $dh, '2014101800' or die "Could not open directory: $!";

# foreach my $file ( readdir( $dh ) ) {
  # print "Skipper, I found $file!\n";
# }

use IO::Dir;

my $dir_fh = IO::Dir->new( '.' );

while( defined( my $file = $dir_fh->read) ) {
  print "Skipper, I found $file!\n";
}

#�@�q�ɶ���
$dir_fh->rewind;

while( defined( my $file = $dir_fh->read) ) {
  print "I can still found $file!\n";
}

<STDIN>