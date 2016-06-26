#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 4;

BEGIN {
    use_ok( 'My::List::Util' ) || print "Bail out!\n";
}

diag( "Testing My::List::Util $My::List::Util::VERSION, Perl $], $^X" );

ok( defined &My::List::Util::sum, 'My::List::Util::sum is defined');
ok( defined &My::List::Util::shuffle, 'My::List::Util::shuffle is defined');
is( &My::List::Util::sum(1..3), 6, 'My::List::Util::sum(1..3) is 6');
