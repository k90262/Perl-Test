#!/usr/bin/perl -w 
use strict;
use IO::File;

my %peopleInfo;
while(<>) {
  #print "Add info: $_ \n";
  my( $person, $info ) = split( /: /, $_ );
  my $data = $_;
  
  print "Add info: $_ \n";
   if( ! $peopleInfo{$person} ) {
	 $peopleInfo{$person} = IO::File->new( "> $person.info" )
	   or die "Could not open create filehandle: $!";
	 $peopleInfo{$person}->print("$data");
	 #print '$peopleInfo{$person}=' . $peopleInfo{$person} . "\n";
   } else {
     $peopleInfo{$person}->print("$data");
	 #print '$peopleInfo{$person}=' . $peopleInfo{$person} . "\n";
   } 
}

<STDIN>