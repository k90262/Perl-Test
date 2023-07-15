#!/usr/bin/perl -w
use strict;
use Cwd;
use v5.11;

=pod

=head1 Syntax

  perl ch3-2_go_home_folder_and_print_filenames_with_given_pattern.plx

=head2 Example

  $ perl ch3-2_go_home_folder_and_print_filenames_with_given_pattern.plx
  Enter folder: /Users/apple/Desktop
  Please enter a regular expression> .txt
      command_memo.txt
      note.txt
      server_info.txt
  Please enter a regular expression> ^C
  $ 

=cut

#chdir; # go to home folder
chdir("/Users/apple/Desktop"); # go to home desktop
say "Enter folder: ", getcwd;

while( 1 ) {
  print "Please enter a regular expression> ";
  chomp( my $regex = <STDIN> );
  last unless( defined $regex && length $regex );

  print 
    map { "    $_\n" }
    grep { eval{ /$regex/ }  }
    glob( ".* *" );
}
