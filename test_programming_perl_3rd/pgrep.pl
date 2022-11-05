#!/usr/bin/perl -w
use strict;
=pod

=head1 usage sample

./pgrep.pl '(?i)perl' *

=head2 result

PERL
perl
Perl

=cut

my $pattern = shift;
while(<>) {
  print "$ARGV:$.: $_" if /$pattern/o; # equal 'grep -n'
} continue {
  close ARGV if eof; # reset $. 
}
