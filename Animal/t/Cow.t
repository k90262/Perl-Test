#!/usr/bin/perl -T
use strict;
use warnings;

use Test::More;

#pass();
BEGIN { 
  use_ok( 'Cow' ) 
  #require_ok( 'Cow' )
}

is( Cow->sound, 'moooo', 'The Cow make the right sound' );

done_testing();
