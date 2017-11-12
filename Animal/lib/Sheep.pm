package Sheep;
use Moose;
use namespace::autoclean;

with 'Animal';
sub default_color { 'black' }
sub sound { 'neigh' }

# instead of default_color function
has 'color' => (
  is => 'rw',
  default => 'white',
);

__PACKAGE__->meta->make_immutable;
