#!/usr/bin/perl -w
use strict;

require 'Navigation.pm';

sub turn_toward_port {
  turn_toward_heading(compute_heading_to_island()); 
}

sub compute_heading_to_island {
  # .. code here ..
  return 20;
}

turn_toward_port();
my @destination = @Navigation::homeport;
print "Homeport Destination: @destination\n";

my @hport = Navigation::get_me_home();
print "my homeport: @hport\n";
