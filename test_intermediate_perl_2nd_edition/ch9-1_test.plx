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
  my($string, $hashPatterns) = @_;
  
  my $rightmost = -1;
  my $position;
  my $rightmostKey;
  foreach my $key ( sort keys %{$hashPatterns}) {
	my $pattern = $hashPatterns->{$key};
	$position = $string =~ m/$pattern/ ? $-[0] : -1;
	if ($position > $rightmost) {
	  $rightmost = $position;
	  $rightmostKey = $key;
	} 
  }

return $rightmostKey; 		
}
