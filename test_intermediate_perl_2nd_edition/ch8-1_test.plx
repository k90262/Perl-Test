#!/usr/bin/perl -w
use strict;
use IO::Tee;

print "Choose mode: Save to <File/String/Both>";
my $input = <STDIN>;
my $fh;
my $string;

if( $input =~ /F.*/) {
  print " File mode...Start!\n";
  open $fh, '>', "ch8-1_File.txt";
}
elsif( $input =~ /S.*/){
  print " String mode...Start!\n";
  open $fh, '>', \ $string;
}
elsif( $input =~ /B.*/){
  print " Both mode(File mode + String mode)...Start!\n";
  open my $file_fh, '>', "ch8-1_File.txt";
  open my $scalar_fh, '>', \ $string;
  $fh = IO::Tee->new($file_fh, $scalar_fh);
}

my $now_string = localtime;
if($fh) {
  print $fh "$now_string\n";
  print "Tis is print content: $now_string\n";
  
  print "
  This is scalar content:
  -------------
  $string
  -------------
  "if $string; 
}
