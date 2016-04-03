#!/usr/bin/perl -w
use strict;
use v5.16;

my @input_data = qw(A T C G 我);
print "Before sort: @input_data\n";

# my @output_data =
#   map	{ EXTRACTION },
#   sort	{ COMPARISON }
#   map	[ CONSTRUCTION ],
#   @input_data;

# my @output_data = 
#   map $_->[0],
#   sort { $a->[1] cmp $b->[1] }
#   map [$_, "\F$_"], # \F是v5.16版的大寫轉換功能
#   @input_data;
# 

my @output_data = sort { "\F$a" cmp "\F$b" } @input_data;
# my @output_data =
#   map $_->{ORIGINAL},
#   sort { $a->{FOLDER} cmp $b->{FOLDER}}
#   map { ORIGINAL => $_, FOLDER => "\F$_" },
#   @input_data;
print "After sort:  @output_data\n";
