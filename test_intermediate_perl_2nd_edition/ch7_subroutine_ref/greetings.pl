#!/usr/bin/perl -w
use strict;

=pod

=head2 Example

  $perl greetings.pl 
  Skipper: Hey there, Gilligan!
  Gilligan: Sir, yes, sir, Skipper!
  (Professor joins the room)
  Skipper: Hey there, Professor!
  Gilligan: Hi, Professor!
  Professor: By my calculations, you must be Gilligan!
  Professor: By my calculations, you must be Skipper!

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

skipper_greets("Gilligan");
gilligan_greets("Skipper");

print "(Professor joins the room)\n";

for my $person (qw(Skipper Gilligan)) {
  $greets{$person}->('Professor');
}

professor_greets("Gilligan");
professor_greets("Skipper");
