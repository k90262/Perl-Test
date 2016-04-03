#!/usr/bin/perl -w
use strict;
use v5.10;

my %patterns = (
  Gilligan   => qr/(?:Willie )?Gilligan/,
  'Mary Ann' => qr/Mary Ann/,
  Ginger     => qr/Ginger/,
  Professor  => qr/(?:The )?Professor/,
  Skipper    => qr/Skipper/,
  'A Howell' => qr/Mrs?. Howell/,
);

my $key = rightmost(
  'There is Mrs. Howell, Ginger, and Gilligan, Skipper',
  \%patterns
);

say "Rightmost character is $key";

sub rightmost {
  my( $string, $patterns ) = @_;

  my( $rightmost_position, $rightmost_key ) = ( -1, undef );
  while( my( $key, $value ) = each %$patterns ) {
    my $position = $string =~ m/$value/ ? $-[0] : -1;
    if( $position > $rightmost_position ) {
      $rightmost_position = $position;
      $rightmost_key = $key;
    }
  }

  return $rightmost_key;
}
