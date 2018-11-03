use Test::More;
use strict;
use warnings;

BEGIN { use_ok('Sheep') }

can_ok( 'Sheep', qw(new sound color name speak) );

my $sheep = Sheep->new( name => 'Mr. Ed');
isa_ok( $sheep, 'Sheep' );
is( $sheep->name, 'Mr. Ed', 'Got the name right' );

done_testing();
