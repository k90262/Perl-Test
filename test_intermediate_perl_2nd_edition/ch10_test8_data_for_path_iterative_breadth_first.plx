#!/usr/bin/perl -w
use strict;
use File::Basename;
use File::Spec::Functions;
use Data::Dumper;

my $data = data_for_path( '.', 2 );
print Dumper( $data ); 

sub data_for_path {
  my( $path, $threshold ) =  @_;

  my $data = {};

  my @queue = ( [ $path, 0, $data ] );

  while ( my $next = shift @queue ) {
    my( $path, $level, $ref ) = @$next;

    my $basename = basename( $path );

    $ref->{$basename} = do {
      if( -f $path or -l $path ) { undef }
      else {
	    my $hash = {};
		if( $level < $threshold ) {
		  opendir my $dh, $path;
		  my @new_paths = map {
		    catfile( $path, $_ )
		    } grep { ! /^\.\.?\z/ } readdir $dh;
          # unshift @queue, map { [ $_, $level+1, $hash ] } @new_paths;
		  push @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
		}
        $hash;
      }
    };
  }

  $data;
}
