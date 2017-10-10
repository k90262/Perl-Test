package Horse;
use Moose;
use namespace::autoclean; # or use 'no Moose' to instead

extends 'Animal';

has 'sound' => ( is => 'ro', default => 'neigh');

__PACKAGE__->meta->make_immutable;

1;
