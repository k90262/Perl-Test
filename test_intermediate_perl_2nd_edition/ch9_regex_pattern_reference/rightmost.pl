#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;

my %patterns = (
  Gilligan   => qr/(?:Wiley )?Gilligan/,
  'Mary-Ann' => qr/Mary-Ann/,
  Ginger     => qr/Ginger/,
  Professor  => qr/(?:The )?Professor/,
  Skipper    => qr/Skipper/,
  'A Howell' => qr/Mrs?. Howell/,
);

say rightmost( 
  'There is Mrs. Howell, Ginger, and Gilligan',
  \%patterns
);	


sub rightmost {
  my( $string, $patterns ) = @_;
  my $debug = 1;
  
  my $rightmost = -1;
  my $key_of_rightmost;
  my $position;
  while( my( $i, $pattern ) = each %$patterns ) {
	print "DEBUG> ", $i, ": ", $pattern, "\n" if $debug;
	$position = $string =~ m/$pattern/ ? $-[0] : -1;
	if ($position > $rightmost) {
		$rightmost = $position;
		$key_of_rightmost = $i;
	}
  }

return $key_of_rightmost;
}
