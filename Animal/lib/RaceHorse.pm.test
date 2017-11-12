package RaceHorse;
use parent qw(Horse);

dbmopen (our %STANDINGS, "standings", 0666)
  or die "Cannot access standings dbm: $!";

# 擴充上層類別的建構函式
sub named {
  my $self = shift->SUPER::named(@_);
  my $name = $self->name;
  my @standings = split ' ', $STANDINGS{$name} || "0 0 0 0";
  @{$self}{qw(wins places shows losses)} = @standings; # use hash slice
  $self;
}

sub won { shift->{wins}++; }
sub placed { shift->{places}++; }
sub showed { shift->{shows}++; }
sub lost { shift->{losses}++; }
sub standings {
  my $self = shift;
  join ', ', map "$self->{$_} $_", qw(wins places shows losses);
}

sub DESTROY {
  my $self = shift;
  $STANDINGS{$self->name} = "@{$self}{qw(wins places shows losses)}"; # use has slice
  $self->SUPER::DESTROY if $self->can( 'SUPER::DESTROY' );
}
1;
