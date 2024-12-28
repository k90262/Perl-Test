#!/usr/bin/perl -w
use strict;

=pod

=head1 NAME
  
  greetings.pl - use subroutine reference in a data strucutre

=head1 SYNOPSIS

  perl greetings.pl

=head2 Example

  $perl greetings.pl 
  
  Gilligan walks into the room.
  
  Skipper walks into the room.
  Skipper: Hey there, Gilligan!
  Gilligan: Sir, yes, sir, Skipper!
  
  Professor walks into the room.
  Professor: By my calculations, you must be Gilligan!
  Gilligan: Hi, Professor!
  Professor: By my calculations, you must be Skipper!
  Skipper: Hey there, Professor!
  
  Ginger walks into the room.
  Ginger: (in a sultry voice) well hello, Gilligan!
  Gilligan: Hi, Ginger!
  Ginger: (in a sultry voice) well hello, Skipper!
  Skipper: Hey there, Ginger!
  Ginger: (in a sultry voice) well hello, Professor!
  Professor: By my calculations, you must be Ginger!

=cut

my %greets = (

  Skipper   => sub {
    my $person = shift;
    print "Skipper: Hey there, $person!\n";
  },

  Gilligan  => sub {
    my $person = shift;
    if ($person eq "Skipper") {
      print "Gilligan: Sir, yes, sir, $person!\n";
    } else {
      print "Gilligan: Hi, $person!\n";
    }
  },

  Professor => sub {
    my $person = shift;
    print "Professor: By my calculations, you must be $person!\n";
  },

  Ginger => sub {
    my $person = shift;
    print "Ginger: (in a sultry voice) well hello, $person!\n";
  },
);

my @room; # room is empty when start
for my $person (qw(Gilligan Skipper Professor Ginger)) {
  print "\n";
  print "$person walks into the room.\n";
  for my $room_person (@room) {
    $greets{$person}->($room_person); # say hello
    $greets{$room_person}->($person); # reply
  }
  push @room, $person; # join to this family
}
