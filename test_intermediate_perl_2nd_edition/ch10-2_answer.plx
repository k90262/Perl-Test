#!/usr/bin/perl -w
use strict;
use Benchmark qw(timethese);

# timethese(-2, {
#   LABEL => CODE_REF,
#   LABEL => CODE_REF,
#   ...
# });

chdir;
my @files = glob '*';
print 'There are ' . @files . " files to compare\n";

my $ordinary = sub {
  my @sorted = sort { -s $a <=> -s $b } @files;
};

my $transform = sub {
  my @sorted =
    map $_->[0],
    sort { $a->[1] <=> $b->[1] } 
    map [$_, -s $_],
    @files;
};

timethese(-2, {
  Ordinary    => $ordinary,
  Schwartzian => $transform,
});
