#!/usr/bin/perl -T

use strict;
use warnings;

#use Test::More tests => 1;
use Test::More 0.62 tests => 1;

# pass();

BEGIN {
  #require_ok( 'Animal' ) || print "Bail out!\n";
  require_ok( 'Animal' ) || BAIL_OUT();
}

diag( "Testing Animal $Animal::VERSION, perl $], $^X" );

