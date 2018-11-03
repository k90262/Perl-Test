use Test::More;
use strict;
use warnings;

BEGIN { use_ok('Cow') }

can_ok( 'Cow', qw(new sound color name speak) );

my $cow = Cow->new( name => 'Mr. Ed');
isa_ok( $cow, 'Cow' );
is( $cow->name, 'Mr. Ed', 'Got the name right' );

done_testing();
