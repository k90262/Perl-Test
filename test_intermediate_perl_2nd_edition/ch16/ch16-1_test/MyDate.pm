package MyDate;
use Carp qw(carp croak);

my %methods = (
  day => 3,
  month => 4,
  year => 5,  
);

sub new { 
  my $class = shift;
  my $self = {};
  bless $self, $class;
}

sub AUTOLOAD {
  our $AUTOLOAD;
  (my $method = $AUTOLOAD) =~ s/.*:://;
  #carp "$method $AUTOLOAD";
  if (exists $methods{$method}) {
    #     0    1    2     3     4    5     6     7     8
    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =
                                                  localtime(time);
    $methods{year} = $year+1900;
    #$methods{year} = 1900; // troubleshooting
    $methods{month} = $mon+1;
    $methods{day} = $mday+1; 

    return $methods{$method};
  } else {
    croak "$_[0] does not understand $method\n";
  }
}


1;
