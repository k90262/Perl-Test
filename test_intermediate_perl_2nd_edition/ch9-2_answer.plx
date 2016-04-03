#!/usr/bin/perl -w
use strict;

open my $fh, '<', 'ch9-2_patterns.txt'
  or die "Could not open patterns.txt $!";

my @patterns;

while( <$fh> ) {
  chomp;
  my $pattern = eval { qr/$_/ }
    or do { warn "Invalid pattern: $@; next "};
  push @patterns, $pattern;
}

# LINE: while( <> ) {
#   foreach my $pattern ( @patterns ) {
#     if( /$pattern/ ) {
#       print "Match at line $. | $_" if /$pattern/;
#       next LINE;
#     }
#   }
# }

while ( <> ) {
  foreach my $pattern ( @patterns ) {
    print "Match of [$pattern]\t\tat line $. | $_" if /$pattern/;
  }
}
close $fh;
