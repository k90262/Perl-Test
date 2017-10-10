package RaceHorse;
use parent qw(Horse);

dbmopen (our %STANDINGS, "standings", 0666)
  or die "Cannot acess standings dbm: $!";

sub named { # 類別方法
  my $self = shift->SUPER::named(@_);
  my $name = $self->name;
  my @standings = split ' ', $STANDINGS{$name} || "0 0 0 0";
  @$self{qw(wins places shows losses)} = @standings;
  $self;
}

sub DESTROY { # 自動調用的實體方法
  my $self = shift;
  $STANDINGS{$self->name} = "@$self{qw(wins places shows losses)}";
  $self->SUPER::DESTROY if $self->can( 'SUPER::DESTROY' );
}

## instance methods:
sub won { shift->{wins}++; }
sub placed { shift->{places}++; }
sub showed { shift->{shows}++; }
sub lost { shift->{losses}++; }
sub standings { 
  my $self = shift; 
  join ", ", map "$self->{$_} $_", qw(wins places shows losses);
}

1;
