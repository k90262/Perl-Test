#!/usr/bin/perl -w
use strict;
use Cow;

sub feed_a_cow_named {
  my $name = shift;
  my $cow = Cow->named($name);
  $cow->eat('grass');
  print "Returning from subroutine.\n"; # $cow 在此處被銷毀
}

print "Start of program.\n";
my $outer_cow = Cow->named('Bessie');
print "Now have a cow named ", $outer_cow->name, ".\n";
feed_a_cow_named('Gwen');
print "Returned from subroutine.\n";
