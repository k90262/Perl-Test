#!/usr/bin/perl -w
use strict;

=pod

=head1 Demo quote-regex operator

=head2 Syntax

  perl ch5.9.2.2_qr_operator.pl
  # show pod 
  #pod2text ch5.9.2.2_qr_operator.pl

=head3 Result

  Item 'MY.STRING' fit regex: (?^si:my.STRING)
  Item '' fit regex: (?^si:^\s*$)

=cut

my @data = ('MY.STRING', '');
my @patterns = ('my.STRING', '^\s*$', '\/; exit();');

=head2 Functions

=head3 my @regexes = map { qr/$_/is } @patterns;

=> This map-operator way equals the below foreach loop:

  my @regexes = ();
  foreach my $pat (@patterns) {
    push @regexes, qr/$pat/is;
  }

=cut
my @regexes = map { eval { qr/$_/is } || warn $@ } @patterns;

foreach my $item (@data) {
  foreach my $re (@regexes) {
    if ($item =~ /$re/ ) { print "Item '$item' fit regex: $re\n"; }
  }
}
