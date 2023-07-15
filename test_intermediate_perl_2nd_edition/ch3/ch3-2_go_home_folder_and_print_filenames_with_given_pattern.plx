#!/usr/bin/perl -w
use strict;

=pod

=head1 Syntax

  perl ch3-2_go_home_folder_and_print_filenames_with_given_pattern.plx

=cut

chdir; # go to home folder

while( 1 ) {
  print "Please enter a regular expression> ";
  chomp( my $regex = <STDIN> );
  last unless( defined $regex && length $regex );

  print 
    map { "    $_\n" }
    grep { eval{ /$regex/ }  }
    glob( ".* *" );
}
