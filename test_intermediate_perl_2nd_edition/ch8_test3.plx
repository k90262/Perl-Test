#!/usr/bin/perl -w
use strict;

# my $command = "$^X -V";
# 
# open my $pipe, '-|', $command
#   or die "Could not open filehandle: $!";
# 
# while( <$pipe> ) {
#   print "Read: $_";
# }

# use IO::Pipe;

# my $pipe = IO::Pipe->new;

# $pipe->reader( "$^X -V" ); # $^X 是Perl現行的可執行程式碼

# while( <$pipe> ) {
  # print "Read $_";
# }

# my $command = "cat";
# open my $pipe, "| $command"
  # or die "Could not open filehandle: $!";
  
# foreach ( 1 .. 10 ) {
  # print $pipe "I can count to $_\n";
# }

use IO::Pipe;

my $pipe = IO::Pipe->new;
my $command = "cat";
$pipe->writer( $command );

foreach ( 1 .. 10 ) {
  print $pipe "I can count to $_\n";
} 

