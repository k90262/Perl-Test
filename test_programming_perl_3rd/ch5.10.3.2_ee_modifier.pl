#! /usr/bin/perl -w
use strict;
=pod

=head1

=head2 Example

  $ perl ch5.10.3.2_ee_modifier.pl 
  I have 23 dollars and 4 cents.

=cut

# Do the same thing when running the following 2:
# s/PATTERN/CODE/ee
# s/PATTERN/eval(CODE)/e

$_ = "I have 4 + 19 dollars and 8/2 cents.\n";
s{ (
     \d+ \s*
     [+*/-]
     \s* \d+
   ) 
}{ $1 }eegx;
print;
