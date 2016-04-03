#!/usr/bin/perl -w
use strict;
use Test::Simple tests => 3;
use Minnow::Diagnostics;

ok( try_motor(), 'The boat motor works' );
ok( check_gas() eq 'Full', 'The gas tank is full' );
ok( check_hull(), 'The full is intact' );

#use Test::More tests => 3;
#is( sqrt(  0), 0, 'The square root of   0 is 0');


