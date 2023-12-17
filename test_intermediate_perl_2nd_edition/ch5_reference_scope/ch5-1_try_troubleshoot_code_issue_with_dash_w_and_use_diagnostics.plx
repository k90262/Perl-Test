#!/usr/bin/perl -w
use strict;
#use warnings;
#use diagnostics;

my %passenger_1 = {
  name => 'Ginger',
  age  => 22,
  hat  => undef, 
};

my %passenger_2 = {
  name => 'Mary Ann',
  age  => 19,
  hat  => 'bonnet', 
};

my @passengers = (\%passenger_1, \%passenger_2);
