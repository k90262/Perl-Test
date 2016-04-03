#!/usr/bin/perl -w
use strict;
use File::Basename;
use File::Spec::Functions;
use Data::Dumper;

my $data = data_for_path( '.' );
print Dumper($data); 

sub data_for_path {
  my( $path ) =  @_;

  my $data = {};

  my @queue = ( [ $path, $data ] );

  while ( my $next = shift @queue ) {
    my( $path, $ref ) = @$next;

    my $basename = basename( $path );

    $ref->{$basename} = do {
      if( -f $path or -l $path ) { undef }
      else {
        my $hash = {};
        opendir my $dh, $path;
        my @new_paths = map {
          catfile( $path, $_ )
          } grep { ! /^\.\.?\z/ } readdir $dh;
        unshift @queue, map { [ $_, $hash ] } @new_paths;
        $hash;
      }
    };
  }

  $data;
}
