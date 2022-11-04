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
  print if /$pattern/o;
}
