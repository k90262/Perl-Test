use Test::More;
use strict;
use warnings;

BEGIN { use_ok('Mouse') }

can_ok( 'Mouse', qw(new sound color name speak) );

my $mouse = Mouse->new( name => 'Mr. Ed');
isa_ok( $mouse, 'Mouse' );
is( $mouse->name, 'Mr. Ed', 'Got the name right' );

done_testing();
