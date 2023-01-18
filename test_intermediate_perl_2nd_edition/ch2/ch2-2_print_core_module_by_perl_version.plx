#!/usr/bin/perl -w
use strict;
use local::lib;
use Module::CoreList;
use List::Util qw(max);

=pod

=head1 Syntax

  perl ch2-2_print_core_module_by_perl_version.plx 

=cut 

my $perl_version = "5.014002";
my $l = Module::CoreList->find_version($perl_version);
my @m = sort keys %{$l};
my $max_name_length = max map { length } @m;
printf "List Module in Perl $perl_version:

%*s Release Date\n"
  , - $max_name_length
  , "Module Name"
  , "Release Date";

print '-'x$max_name_length, '-' x length ' Release Date', "\n";

foreach my $m ( @m ) {
  my $r = $Module::CoreList::released{ Module::CoreList->first_release( $m ) };
  printf "%*s %s\n"
    , - $max_name_length
    , $m
    , $r;
}
