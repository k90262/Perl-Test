#!/usr/bin/perl -w
#use strict;
#use v5.10.1;

# my @patterns = (
  # qr/(?:Willie )?Gilligan/,
  # qr/Mary Ann/,
  # qr/Ginger/,
  # qr/(?:The )?Professor/,
  # qr/Skipper/,
  # qr/Mrs?. Howell/,
  # qr/(?i:B)ill/,
# );

# my $name = 'The Professor';

# foreach my $pattern ( @patterns ) {
  # if ( $name ~~ $pattern ) {
    # say "Match!";
    # last;
  # }
# } 

# say "Match!" if $name ~~ @patterns;

##########################
# my %patterns = (
  # Gilligan 		=> qr/(?:Willie )?Gilligan/,
  # 'Mary Ann'	=> qr/Mary Ann/,
  # Ginger		=> qr/Ginger/,
  # Professor		=> qr/(?:The )?Professor/,
  # Skipper		=> qr/Skipper/,
  # 'A Howell'	=> qr/Mrs?. Howell/,
  # Bill			=> qr/(?i:B)ill/,
# );

# my $name = 'bill';

# my( $match ) = grep { $name =~ $patterns{$_} } keys %patterns;

# say "Matched $match" if $match;
###########################

#use v5.10.1;
use v5.12;

use List::Util qw(first);

my %patterns = (
  Gilligan 	=> qr/(?:Willie )?Gilligan/,
  'Mary Ann'	=> qr/Mary Ann/,
  Ginger	=> qr/Ginger/,
  Professor	=> qr/(?:The )?Professor/,
  Skipper	=> qr/Skipper/,
  'A Howell'	=> qr/Mrs?. Howell/,
  Bill		=> qr/(?i:B)ill/,
);

#my $name = 'bill';

#my ( $match ) = first { $name =~ $patterns{$_} } keys %patterns;

#say "Matched $match" if $match;

#my $position = rightmost(
#  'Mary Ann and Ginger',
#  qr/Mary/, qr/Gin/,
#  );

sub rightmost {
  my( $string, @patterns ) = @_;

  my $rightmost = -1;
  while( my( $i, $pattern ) = each @patterns) {
    my $position = $string =~ m/$pattern/ ? $-[0] : -1;
    $rightmost = $position if $position > $rightmost;
  }

  return $rightmost;
}

my $position = rightmost(
  'There is Mrs. Howell, Ginger, and Gilligan',
  @patterns{ sort keys %patterns }
);
say "Rightmost match at position $position";
