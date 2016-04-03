#!/usr/bin/perl -w
use strict;
# use v5.10.1;


# my $passenger = qr/(?:Mr. Howell|Mrs. Howell|Mary Ann)/;

# while( <STDIN> ) {
  # say if /$passenger/;
# }

use Regexp::Assemble;

my $ra = Regexp::Assemble->new;
for ('Mr. Howell', 'Mrs. Howell', 'Mary Ann') {
  $ra->add( "\Q$_" );
}

print $ra->re, "\n";