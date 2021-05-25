#!/usr/bin/perl -w
use strict;

my $Debug_Level = 0;
my $Generate_Listing = 0;
my $In_Place = "";

ARG: while (@ARGV && $ARGV[0] =~ s/^-(?=.)//) {
  OPT: for (shift @ARGV) {
    m/^$/	&& do {                         	next ARG; };
    m/^-$/	&& do {                         	last ARG; };
    s/^d//	&& do { $Debug_Level++;         	redo OPT; };
    s/^l//	&& do { $Generate_Listing++;    	redo OPT; };
    s/^i(.*)//	&& do { $In_Place = $1 || ".bak";	next ARG; };
    say_usage("Unknow option: $_");
  }
}

sub say_usage
{
  my $w = shift @_;
  print "$w !. Please try agin with this argument sytax: -[-dli.bak]\n";
}

print "======DUMP VAR======\n";
print "Debug Level      : $Debug_Level\n";
print "Generate Listing : $Generate_Listing\n";
print "In Place         : $In_Place\n";
