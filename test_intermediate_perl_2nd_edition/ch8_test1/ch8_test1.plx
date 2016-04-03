#!/usr/bin/perl -w
use strict;

# open LOG_FH, '>>', 'castaways.log'
  # or die "Could not open castaways.log: $!";
  
# log_message( *LOG_FH, 'The Globetrotters are stranded with us!' );
# log_message( \*LOG_FH, 'An astronaut passed overhead' );

# sub log_message {
  # local *FH = shift;
 
  # print FH @_, "\n";
# }
##############################################################

# print "1. This goes to the real standard output\n";

# my $string;
# {
  # local *STDOUT;
  # open STDOUT, '>', \ $string;
  
  # print "2. This goes to the string\n";
# }

# print "3. This goes to the real standard output\n";

# open my $string_fn, '<', \ $string;
# while( <$string_fn> ) {
  # print $_;
# } 

# sub output_to_fh {
  # my( $fh, @data ) = @_;
  # print $fh @data;
# }

# sub as_string {
  # my( @data ) = @_;
  # open my $string_fh, '>', \ my $string;
  # output_to_fh( $string_fh, @data );
  # $string;
# }

# my $multiline_string = as_string("1", "2", "3");
# open my $string_fh, '<', \ $multiline_string;
# while( <$string_fh> ) {
  # print $_, "\n";
# }
##############################################################
# use v5.10;

# while( <> ) {
  # state $fhs;
  
  # my( $source, $destination, $bytes ) = split;
  
  # unless( $fhs->{$source} ) {
    # open my $fh, '>>', $source or die "...open file $source fail";
	# $fhs->{$source} = $fh;
  # }
  
  # say { $fhs->{$source} } "$destination $bytes";
# }

use v5.10;

{ # 以未修飾程式碼區塊限定$fhs的作用範圍
  my $fhs;
  
  while( <> ) {
    my( $source, $destination, $bytes ) = split;
  
    unless( $fhs->{$source} ) {
      open my $fh, '>>', $source or die "...open file $source fail";
	  $fhs->{$source} = $fh;
    }
  
    say { $fhs->{$source} } "$destination $bytes";
  }
}
<STDIN>