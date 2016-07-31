#!/usr/bin/perl -T
use strict;
use warnings;

use Test::More;

#pass();
BEGIN { 
  use_ok( 'Sheep' ) 
  #require_ok( 'Cow' )
}

is( Sheep->sound, 'baaah', 'The Sheep make the right sound' );

done_testing();
