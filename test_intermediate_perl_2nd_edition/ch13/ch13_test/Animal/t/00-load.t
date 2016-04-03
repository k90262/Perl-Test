#!perl -T

use Test::More tests => 7;

BEGIN {
  foreach my $class ( qw(Animal Cow Horse Sheep Mouse LivingCreature Person) ) {
    use_ok( $class )
      or print "Bail out! $class does not compile!\n";
  }
}

diag( "Testing Animal $Animal::VERSION, perl $], $^X" );
