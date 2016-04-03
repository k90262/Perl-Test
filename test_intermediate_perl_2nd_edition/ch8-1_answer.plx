#!/usr/bin/perl -w 
use strict;

use IO::Tee;
use v5.8;

my $fh;
my $scalar;

print 'Enter type of output [Scalar/File/Tee]> ';
my $type = <STDIN>;

if( $type =~ /^s/i ) {
  open $fh, '>', \$scalar;
}
elsif( $type =~ /^f/i ) {
  open $fh, '>', "$0.out";
}
elsif( $type =~ /^t/i ) {
  open my $file_fh, '>', "$0.out"
    or die "Could not open $0.out: $!";
  open my $scalar_fh, '>', \$scalar;
  $fh = IO::Tee->new( $file_fh, $scalar_fh );
}

my $date 		= localtime;
my $day_of_week = (localtime)[6];

print $fh <<"HERE";
This is run $$
The date is $date
The day of the week is $day_of_week
HERE

print STDOUT <<"HERE" if $type =~ m/^[st]/i;
Scalar contains:
$scalar
HERE