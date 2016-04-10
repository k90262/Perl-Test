#!/usr/bin/perl -w
use strict;
#use Test::Simple tests => 3;
#use Test::More tests => 3;
use Minnow::Diagnostics;
#
#ok( try_motor(), 'The boat motor works' );
#ok( check_gas() eq 'Full', 'The gas tank is full' );
#ok( check_hull(), 'The full is intact' );

#use Test::More tests => 3;
#is( sqrt(  0), 0, 'The square root of   0 is 0');


use Test::More;
#use Test::Simple;
ok( try_motor(), 'The boat motor works' );
ok( check_gas() eq 'Full', 'The gas tank is full' );
is( check_gas(), 'Full', 'The gas tank is full' );
is( check_gas(), 'Empty', 'The gas tank is empty' );
isnt( check_hull(), 'Broken', 'The full is intact' );
like( 'Mary Ann', qr/Mary[ -]Anne?/, 'Mary Ann is a passenger' );
unlike( 'Ginger', qr/Mary[ -]Anne?/, 'Ginger is a passenger' );

my @this_array = ( 'hi' );
my @that_array = ( 'hi' );
is_deeply( \@this_array, \@that_array, 'The arrays are the same' );
done_testing();
