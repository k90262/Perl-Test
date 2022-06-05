#!/usr/bin/perl -w
use strict;

# case array context
my $paragrapth = "Perl is a program that use perl language to write perl document.";
my @perls;
if (@perls = $paragrapth =~ /perl/gi)
{
  printf "Perl methioned  %d times.\n", scalar @perls;
}

# case covert to hash by quote of regex
my $string = "password=xyxxz verbose=9 score=0";
my %hash;
%hash = $string =~ /(\w+)=(\w+)/g;
foreach my $key (keys %hash)
{
  print "hash.$key=".$hash{$key}."\n";
}

# case m??
my @words = qw(neurad neureee neurpnology);
my ($first, $last);
while (@words)
{
  $_ = shift @words;
  $first = $1 if m?^(neur\w*)?;
  $last  = $1 if m/^(neur\w*)/;
}
print "first: $first\n";
print "last : $last\n";

