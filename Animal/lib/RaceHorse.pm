package RaceHorse;
use parent qw(Horse);
# 擴充上層類別的建構函式
sub named {
  my $self = shift->SUPER::named(@_);
  $self->{$_} = 0 for qw(wins places shows losses);
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
1;
