#!perl -T
use strict;

use Test::More;

BEGIN { use_ok( 'My::List::Util' ) };

ok( defined &My::List::Util::sum, 
  'sum() is diefined');
is( My::List::Util::sum( 1, 2, 3), 6,
  '1+2+3 is six' );
is( My::List::Util::sum( qw(1 2 3) ), 6,
  '1+2+3 as string is six' );
is( My::List::Util::sum( 4, -9, 37, 6), 38,
  '4-9+37+7 is 38' );
is( My::List::Util::sum( 3.14, 2.2 ), 5.34,
  '3.14 + 2.2 is 5.34' );
is( My::List::Util::sum(), undef,
  'No arguments resturns undef' );
is( My::List::Util::sum( qw(a b) ), undef,
  'All bad args gives undef' );
is( My::List::Util::sum( qw(a b 4 5) ), 9,
  'Some good args works' );

done_testing();
