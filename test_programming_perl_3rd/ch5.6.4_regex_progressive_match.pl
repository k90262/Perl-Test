#!/usr/bin/perl -w
use strict;

my $burglar = "Bilbo Baggins";
print "Burglar Name: $burglar\n";
print "----------------------\n";

while ($burglar =~ /b/gi) {
  printf "Found a B at %d\n", pos($burglar) -1;
}


print "----------------------\n";
print "[Regex] add modifier \\c \n";
while ($burglar =~ /b/gci) {
  printf "Found a B at %d\n", pos($burglar) -1;
}
print "\n";
print "[Regex] search I in \$burgalr again (without modifier \\c) \n";
while ($burglar =~ /i/gi) {
  printf "Found a I at %d\n", pos($burglar) -1;
}

=pod

=head2 Example:

 perl ch5.6.4_regex_progressive_match.pl

=head2 Output:

 Burglar Name: Bilbo Baggins
 ----------------------
 Found a B at 0
 Found a B at 3
 Found a B at 6
 ----------------------
 [Regex] add modifier \c 
 Found a B at 0
 Found a B at 3
 Found a B at 6
 
 [Regex] search I in $burgalr again (without modifier \c) 
 Found a I at 10

=cut
