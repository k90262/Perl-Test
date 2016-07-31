#!/usr/bin/perl -T
use strict;
use warnings;

use Test::More;

#pass();
BEGIN { 
  use_ok( 'Horse' ) 
  #require_ok( 'Cow' )
}

is( Horse->sound, 'neigh', 'The Horse make the right sound' );

done_testing();
