#!/usr/bin/perl -w
use strict;

# use IO::Handle;

# my $filename = "ch8_test2_output.txt";
# open my $fh, '>', $filename;
# $fh->print( 'Coconut headphones' );
# $fh->close;

# use IO::File;
# {
# my $fh = IO::File->new( '> castaaways.log' )
	# or die "Could not create filehandle: $!";

# my $read_fh  = IO::File->new( 'castaways.log', 'r') or die "Could not create r filehandle: $!";
# my $write_fh = IO::File->new( 'castaways.log', 'w' ) or die "Could not create w filehandle: $!";	
# my $append_fh = IO::File->new( 'castaways.log', O_WRONLY|O_APPEND) or die "Could not create append filehandle: $!";

# my $temp_fh = IO::File->new_tmpfile;
# $temp_fh->close or die "Could not close file: $!";
# undef $append_fh;

# }
# open my $fh, '+>', undef
	# or die "Could not open temp file: $!";

#use IO::Scalar;
#
#my $string_log = '';
#my $scalar_fh = IO::Scalar->new( \$string_log );
#
#print $scalar_fh "The Howells's private beach club is closed\n";
#
#print $string_log;
#
#while( <$scalar_fh> ) { # not work. maybe we need a real file to test it.
#  print "***";
#  next unless /Howells/;
#  print;
#}	

open my $log_fh, '>>', 'castaways.log'
  or die "Could not open castaways.log";

open my $scalar_fh, '>>', \ my $string;

my $log_message = "The Minnow is taking on water!\n";
# print $log_fh	 $log_message;
# print $scalar_fh $log_message;
for my $fh ( $log_fh, $scalar_fh ) {
  print $fh $log_message;
}

use IO::Tee;

#my $tee_fh = IO::Tee->new( $log_fh, $scalar_fh );

#print $tee_fh "The radio works in the middle of the ocean!\n";

my $read_scalar_string = "Hi Hi Hellow~!\n";
open my $read_fh, '<', \ $read_scalar_string
  or die "Could not open scalar sting: $!";

my $tee_fh = IO::Tee->new( $read_fh, $log_fh, $scalar_fh );

my $message = <$tee_fh>;
print '$message = ', $message; # for show the result of example code
print '$string (input by $scalar_fh) = ', $string; # for show the result of example code

print "Done. Please click 'enter' to exit.";
<STDIN>
