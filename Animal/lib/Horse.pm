package Horse;
use Moose;
use namespace::autoclean; # or use 'no Moose' to instead

with 'Animal';
sub default_color { 'brown' }
sub sound { 'neigh' }

1;
