#!/usr/bin/perl -w
use strict;

# common list operator: print, sort, reverse

print 'Two castaways are ', 'Gilligan', ' and ', 'Skipper', "\n";

my @castaways = sort qw(Gilligan Skipper Ginger Professor Mary_Ann);
printf "%*s %s %s", 50, "sorted castaways: ", join(', ', @castaways), "\n";

@castaways = reverse  qw(Gilligan Skipper Ginger Professor Mary_Ann);
printf "%*s %s %s", 50,  "reversed castaways: ", join(', ', @castaways), "\n";

@castaways = qw(Gilligan Skipper Ginger Professor);
push @castaways, 'Mary_Ann';
@castaways = reverse @castaways;
printf "%*s %s %s", 50,  "reversed (and replaced) castaways: ", join(', ', @castaways), "\n";

print "\n";
# check value > 10 in a array

my @input_numbers = (1, 2, 4, 8, 16, 32, 64);
my @bigger_than_10 = grep $_ > 10, @input_numbers;
print " input_numbers: ", join(", ", @input_numbers), "\n";
print "bigger_than_10: ", join(", ", @bigger_than_10), "\n";
