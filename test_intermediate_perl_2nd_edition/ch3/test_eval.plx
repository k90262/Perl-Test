#!/usr/bin/perl -w
use strict;

print "\n--test_eval_statement--\n";

sub test_eval_statement {
  my ($total, $count) = @_;
  my $average;
  eval { $average = $total / $count };
  print "Continuing after error: $@" if $@;
}

print "start the 1st computing....\n";
test_eval_statement(100, 10);
print "start the 2nd computing....\n";
test_eval_statement(100, 0);
print "Finish computing.\n";


sub test_eval_functional {
  my ($total, $count) = @_;
  my $average = eval { $total / $count };
  print "Continuing after error: $@" if $@;
  return (defined $average) ? $average : -1;
}

print "\n---test_eval_functional---\n";

print "start the 1st computing....\n";
print "=>result: ", test_eval_functional(100, 10), "\n";
print "start the 2nd computing....\n";
print "=>result (undef return -1): ", test_eval_functional(100, 0), "\n";
print "Finish computing.\n";


