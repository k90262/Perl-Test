#!/user/bin/perl -w
use strict;

{
  package MyDate;
  use vars qw($AUTOLOAD);

  use Carp;

  my %Allowed_methods	= qw( date 3 month 4 year 5 );
  my @Offsets		= qw( 0 0 0 0 1 1900 0 0 0 );
  sub new { bless {}, $_[0] }
  sub DESTROY {}

  sub AUTOLOAD {
    my $method = $AUTOLOAD;
    $method =~ s/.*:://;

    unless ( exists $Allowed_methods{ $method } ) {
      carp "Unknown method: $AUTOLOAD";
      return;
    }

    my $slice_index = $Allowed_methods{ $method };

    return (localtime)[$slice_index] + $Offsets[$slice_index];
  }
}

MyDate->import; # we don't use it
my $date = MyDate->new();

sub UNIVERSAL::debug {
  my $self = shift;
  my $when = localtime;
  my $message = join '|', @_;
  print "[$when] $message\n";
}

print "The date is " . $date->date . "\n";
print "The month is " . $date->month . "\n";
print "The year is " . $date->year . "\n";

$date->debug("I'm all done");
