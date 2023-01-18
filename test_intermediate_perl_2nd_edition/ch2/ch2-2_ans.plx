#!/usr/bin/perl -w
use strict;

use local::lib;

use Module::CoreList;

my @modules = sort keys %{$Module::CoreList::version{5.014002}};

my $max_length = 0;
foreach my $module ( @modules ) {
  $max_length = length $module if 
    length $module > $max_length;
}

foreach my $module ( @modules ) {
  printf "%*s %s\n",
    - $max_length,
    $module,
    $Module::CoreList::released{ Module::CoreList->first_release( $module ) };
}
