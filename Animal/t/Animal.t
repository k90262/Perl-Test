#!/usr/bin/perl -T

use strict;
use warnings;

#use Test::More tests => 1;
use Test::More 0.62 tests => 4;

# pass();

BEGIN {
  #require_ok( 'Animal' ) || print "Bail out!\n";
  require_ok( 'Animal' ) || BAIL_OUT();
}

diag( "Testing Animal $Animal::VERSION, perl $], $^X" );

# 在 Animal.pm 中，必須定義這些方法。
ok( defined &Animal::speak, 'Animal::speak is defined' );
ok( defined &Animal::sound, 'Animal::sound is defined' );

# 檢查 sound() 方法是否可 die
eval { Animal->sound() } or my $at = $@;
like( $at, qr/You must/, 'sound() dies with a message' );
