#!/usr/bin/perl -w
use strict;

=pod

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

=cut

sub skipper_greets {
  my $person = shift;
  print "Skipper: Hey there, $person!\n";
}

sub gilligan_greets {
  my $person = shift;
  if ($person eq "Skipper") {
    print "Gilligan: Sir, yes, sir, $person!\n";
  } else {
    print "Gilligan: Hi, $person!\n";
  }
}

sub professor_greets {
  my $person = shift;
  print "Professor: By my calculations, you must be $person!\n";
}

my %greets = (
  Gilligan  => \&gilligan_greets,
  Skipper   => \&skipper_greets,
  Professor => \&professor_greets,
);

my @room; # room is empty when start
for my $person (qw(Gilligan Skipper Professor)) {
  print "\n";
  print "$person walks into the room.\n";
  for my $room_person (@room) {
    $greets{$person}->($room_person); # say hello
    $greets{$room_person}->($person); # reply
  }
  push @room, $person; # join to this family
}
