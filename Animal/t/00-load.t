#!perl -T

BEGIN {
  my @classes = qw(Animal Cow Sheep Horse Mouse);
  my $n = @classes;
  diag("$n");
  #use Test::More tests => scalar @classes;
  use Test::More;
  plan tests => scalar @classes; # Confirmed Errata | Page 213, 2nd code example, 4th line

  foreach my $class ( @classes ) {
    use_ok( $class ) || print "Bail out! $class did not load!\n";
  }
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
