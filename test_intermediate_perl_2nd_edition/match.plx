#!/usr/bin/perl -w
#use strict;

print 'Enter a pattern: ';
chomp( my $pattern = <STDIN> );

if( ! is_valid_pattern( $pattern ) ) {
  die "There was a regex problem: $@\n";
}

print "Enter some lines:\n";
while( <STDIN> ) {
  # if( eval { m/$pattern/ } ) {
	# print "Match: $_";
  # }
  
  find_match($pattern);
  
  # if( $@ ) {
    # die "There was a regex problem: $@\n";
  # }
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
  return ( length $@ ? 0 : 1);
}