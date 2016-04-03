#!/usr/bin/perl -w
use strict;

# my $alpha	= qr/[a-z]/;
# my $digit	= qr/\d/;
# my $alphadigit	= qr/(?i:$alpha|$digit)/;
# 
# while(<STDIN>) {
#   print if /$alphadigit/;
# }

# use v5.10.1;
# use Regexp::Common qw(URI);

# while( <STDIN> ) {
 # print if /$RE{URI}{HTTP}/;
# }

# use v5.10.1;
# use Regexp::Common qw(zip);

# say $RE{zip}{US};

# use v5.10.1;
# use Regexp::Common qw(net);

# while( <STDIN> ) {
  # say if /$RE{net}{IPv4}/;
# }


# use v5.10.1;
# use Regexp::Common qw(number);

# while( <> ) {
  # say if /$RE{num}{int}/;
# }

use v5.10.1;
use Regexp::Common qw(number);

while( <STDIN> ) {
  say $1 if /$RE{ -base => 16 }{num}{ -keep }{int}/
}
<STDIN>;