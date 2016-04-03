#!/usr/bin/perl -w
use strict;
# use File::Find;

# sub print_bigger_then {
  # my $minimum_size = shift;
  # return sub { print "$File::Find::name\t" . -s . "\n" if -f and -s >= $minimum_size };
# }

# my $bigger_than_1024 = print_bigger_then(1024);
# find($bigger_than_1024, '.');

# use File::Find;
# use File::Find::Closures qw(:all);

# my( $wanted, $list_reporter ) = find_by_name( qw(readme.txt) );

# find( $wanted, '.' );

# my @readmes = $list_reporter->();
# print "@readmes";

use File::Spec::Functions qw(canonpath no_upwards);
use File::Find;

sub find_by_min_size {
  my $min = shift;
  
  my @files = ();
  
  sub { print "Before canonpath:\t", $File::Find::name, "\n";
		print "After canonpath:\t", canonpath( $File::Find::name ), "\n";
		push @files, canonpath( $File::Find::name ) if -s $_ >= $min},
  sub { print "Before no_upwards:\t@files\n";
		@files = no_upwards( @files );
		print "After no_upwards:\t@files\n";
		wantarray ? @files : [ @files ] }
}

my( $wanted, $list_reporter ) = find_by_min_size(1024);

find($wanted, ".");
my @list = $list_reporter->();
 
<STDIN>