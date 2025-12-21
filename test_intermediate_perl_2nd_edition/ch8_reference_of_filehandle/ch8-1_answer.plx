#!/usr/bin/perl -w
use strict;
use IO::Tee;
use v5.8;

=pod

=head1 Ch8-1 practice: print date and day of week into (1 file, (2 scalar, or (3. both - book-answer ver.

=head2 Prerequisites

IO::Tee installed.

e.g. 

  $ git clone https://github.com/neilb/IO-Tee
  $ cd IO-Tee
  $ cat README # e.g., install to your PERL5LIB path:  perl Makefile.PL INSTALL_BASE=/Users/apple/perl5

=head2 Example

  $ perl ch8-1_answer.plx   
  Enter type of output [Scalar/File/Tee]> t
  Scalar contains:
  This is run 74135
  The date is Mon Dec  1 01:05:06 2025
  The day of the week is 1
  
  $ cat ch8-1_answer.plx.out 
  This is run 74135
  The date is Mon Dec  1 01:05:06 2025
  The day of the week is 1

=cut

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

my $date        = localtime;
my $day_of_week = (localtime)[6];

print $fh <<"HERE" if (defined $fh);
This is run $$
The date is $date
The day of the week is $day_of_week
HERE

print STDOUT <<"HERE" if $type =~ m/^[st]/i;
Scalar contains:
$scalar
HERE
