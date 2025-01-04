#!/usr/bin/perl -w
use strict;
use File::Find;

=pod

=head1 NAME

demo_callback_via_file_find.pl - demo `callback` via calling function find() from out-of-box module File::Find

=head1 SYNOPSIS

perl demo_callback_via_file_find.pl

=cut

sub whatt_to_do {
  print "$File::Find::name found\n";
}

my @starting_directories = qw(.);

find(\&whatt_to_do, @starting_directories);

# OR using anonymous function to instead of:
# perl -e 'use File::Find; find(sub { print "$File::Find::name found\n"}, qw(.));'
