#!perl -T

BEGIN {
  my @classes = qw(Animal Cow Sheep Horse Mouse);
  my $n = @classes;
  diag("$n");
  use Test::More tests => 5;
  #use Test::More tests => 5;

  foreach my $class ( @classes ) {
    use_ok( $class ) || print "Bail out! $class did not load!\n";
  }
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
