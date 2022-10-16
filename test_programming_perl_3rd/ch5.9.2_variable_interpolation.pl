#!/usr/bin/perl -w
use strict;

=pod

=head1 regex example

  $> perl ch5.9.2_variable_interpolation.pl 
  Please enter a action or a number: send
  Action is send

  $> perl ch5.9.2_variable_interpolation.pl
  Please enter a action or a number: ed
  Action is edit

  $> perl ch5.9.2_variable_interpolation.pl
  Please enter a action or a number: 2131
  It's a number.

=cut

print "Please enter a action or a number: ";
chomp(my $answer = <STDIN>);

if 	("SEND"  =~ /^\Q$answer/i) { print "Action is send\n"; }
elsif 	("STOP"  =~ /^\Q$answer/i) { print "Action is stop\n"; }
elsif 	("ABORT" =~ /^\Q$answer/i) { print "Action is abort\n"; }
elsif 	("LIST"  =~ /^\Q$answer/i) { print "Action is list\n"; }
elsif 	("EDIT"  =~ /^\Q$answer/i) { print "Action is edit\n"; }
else	{
  my $sign = '[+-]?';
  my $digits = '\d+';
  my $decimal = '\.?';
  my $more_digits = '\d*';
  my $number = "$sign$digits$decimal$more_digits";

  if ($answer =~ /$number/o) { print "It's a number.\n" }
}
#print $answer, "\n";
