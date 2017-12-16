package Animal;
use Moose::Role;
{
  use Moose::Util::TypeConstraints;
#  use namespace::autoclean;
  enum 'ColorStr' => [qw( white brown black )];
#  {
#    my %colors = map { $_, 1 } qw( white brown black );
#    subtype 'ColorStr'
#      => as 'Str'
#      => where { exists $colors{$_} }
#      => message {
#        "I don't think [$_] is a real color"
#      };
#  }
}
use namespace::autoclean;

requires qw( sound default_color );

has 'name' => ( 
  is => 'rw',
  #default => sub { 'an unnamed ' . ref shift},
  required => 1,
);
around 'name' => sub {
  #print "trace around 'name'...\n";
  my $next = shift;
  my $self = shift;
  blessed $self ? $self->$next(@_) : "an unnamed $self";
  #blessed $self ? $self->$next(@_) : print "an unnamed $self\n";
};

has 'color'=> ( 
  is => 'rw',
  default => sub { shift->default_color },
  isa => 'ColorStr'
);

sub speak {
  my $self = shift;
  print $self->color, " ",  $self->name, " goes ", $self->sound, "\n";
}

1;
