#!/usr/bin/perl -w
use strict;

my %gilligan_info = (
  name	   => 'Gilligan',
  hat	   => 'White',
  shirt	   => 'Red',
  position => 'First Mate',
);

my %skipper_info = (
  name 	   => 'Skipper',
  hat  	   => 'Black',
  shirt	   => 'Blue',
  position => 'Captain',
);

my %mr_howell = (
  name	   => 'Mr. Howell',
  hat	   => undef,
  shirt	   => 'white',
  position => 'Passenger',
);

my @castaways = (\%gilligan_info, \%skipper_info, \%mr_howell);

foreach my $person (@castaways) {
  $person->{location} = ($person->{name} =~ /Howell/) ? 
	'The Island Country Club' : 'The Island';

  print "$person->{name} at $person->{location}\n";
} 
