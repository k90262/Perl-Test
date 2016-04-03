#!/usr/bin/perl -w
use strict;
use Regexp::Assemble;

open my $fh, '<', 'ch9-2_patterns.txt'
  or die "Could not open ch9-2_patterns.txt: $!";

my $ra = Regexp::Assemble->new;

while( <$fh> ) {
  chomp;
  $ra->add( $_ );
}

my $overall = $ra->re;
print "Regexp is: $overall\n";

while( <> ) {
  print "Match at line $. | $_" if /$overall/;
}
