#!/usr/bin/perl -w
use strict;

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

skipper_greets("Gilligan");
gilligan_greets("Skipper");

print "(Professor joins the room)\n";

skipper_greets("Professor");
gilligan_greets("Professor");


sub professor_greets {
  my $person = shift;
  print "Professor: By my calculations, you must be $person!\n";
}

professor_greets("Gilligan");
professor_greets("Skipper");
