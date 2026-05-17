#!/usr/bin/perl -w
use strict;

=pod

=head1 NAME
  match.plx - Match lines against a user-supplied pattern

=head1 SYNOPSIS
  $ perl match.plx
  Enter a pattern: ^foo
  Enter some lines:
  foo bar
  Match: foo bar
  baz qux
  foo baz
  Match: foo baz

=head1 DESCRIPTION
  This script prompts the user to enter a regex pattern, then reads lines from standard input and
  prints those that match the pattern. It includes error handling to manage invalid regex patterns.

=cut

print 'Enter a pattern: ';
chomp( my $pattern = <STDIN> );

is_valid_pattern( $pattern );

print "Enter some lines:\n";
while( <STDIN> ) {
#    if( eval { m/$pattern/ } ) {
# 	 print "Match: $_";
#    }
#   
  find_match($pattern);
#   
#    if( $@ ) {
#      die "There was a regex problem: $@\n";
#    }
}

sub find_match {
  my( $pattern ) = @_;
  if( eval { m/$pattern/ } ) {
    print "Match: $_";
  }
}

sub is_valid_pattern {
   my( $pattern ) = @_;
   local( $@ );
   
   eval { '' =~ /$pattern/ };
   if( $@ ) {
     die "There was a regex problem: $@\n";
   }
   #return ( $@ ? 0 : 1);
 }
