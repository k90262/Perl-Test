#!/usr/bin/perl -T

use strict;
use warnings;

#use Test::More tests => 1;
use Test::More;

# pass();

BEGIN {
  #require_ok( 'Animal' ) || print "Bail out!\n";
  require_ok( 'Mouse' ) || BAIL_OUT();
}

diag( "Testing Mouse $Mouse::VERSION, perl $], $^X" );

# 在 Animal.pm 中，必須定義這些方法。
ok( defined &Mouse::speak, 'Mouse::speak is defined' );
ok( defined &Mouse::sound, 'Mouse::sound is defined' );

is( Mouse->sound, 'squeak', 'The Mouse make the right sound' );
ok( Mouse->speak, 'An Mouses does the right thing for speak' );

done_testing();
