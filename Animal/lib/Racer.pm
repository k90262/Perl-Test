package Racer;
use Moose::Role;
use namespace::autoclean;
has $_ => (is => 'rw', default => 0) 
  foreach qw(wins places shows losses);

sub won 	{ my $self = shift; $self->wins($self->wins + 1) }
sub placed 	{ my $self = shift; $self->places($self->places + 1) }
sub showed 	{ my $self = shift; $self->shows($self->shows + 1) }
sub lost 	{ my $self = shift; $self->losses($self->losses + 1) }

sub standings {
  my $self = shift;
  join ", ", map { $self->$_ . " $_" } qw(wins places shows losses);
}

1;
