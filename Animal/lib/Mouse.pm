package Mouse;
use Moose;
use namespace::autoclean; # or use 'no Moose' to instead

with 'Animal';

sub default_color { 'white' }
sub sound { 'squeak' }

after 'speak' => sub {
  print "[but you can barely hear it!]\n";
};

__PACKAGE__->meta->make_immutable;
1;
