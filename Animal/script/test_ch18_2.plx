#!/usr/bin/perl -w
use strict;
use Cow;

{ package Barn;
  sub new { bless [ ], shift }
  sub add { push @{shift()}, shift }
  sub contents { @{shift()} }
  sub DESTROY {
    my $self = shift;
    print "$self is being destroyed...\n";
    for ($self->contents) {
      print ' ', $_->name, " goes homeless.\n";
    }
  }
}

my $barn = Barn->new;
my @cows = (Cow->named('Bessie'), Cow->named('Gwen'));
#$barn->add(Cow->named('Bessie'));
#$barn->add(Cow->named('Gwen'));
$barn->add($_) for @cows;
print "Burn the barn:\n";
$barn = undef;
print "Lost the cows:\n";
@cows = ( );
print "End of program.\n";

print "\n" x 2;

{ package Barn2;
  sub new { bless [ ], shift }
  sub add { push @{shift()}, shift }
  sub contents { @{shift()} }
  sub DESTROY {
    my $self = shift;
    print "$self is being destroyed...\n";
    while (@$self) {
      my $homeless = shift @$self;
      print ' ', $homeless->name, " goes homeless.\n";
    }
  }
}


$barn = Barn2->new;
$barn->add(Cow->named('Bessie'));
$barn->add(Cow->named('Gwen'));
print "Burn the barn:\n";
$barn = undef;
print "End of program.\n";
