#!/usr/bin/perl -w
use strict;
use File::Basename;
use File::Spec::Functions;
use Data::Dumper;

sub data_for_path {
  my( $path, $threshold, $which_first ) = @_;

  my $data = {};
  my @queue = ( [ $path, 0, $data ] ); 

  while ( my $next = shift @queue ) {
    my( $temp_path, $level, $temp_data ) = @$next;

    my $basename = basename( $temp_path );

    $temp_data->{$basename} = do {
      if( -f $temp_path or -l $temp_path ) { undef }
      else {
        my $hash = {};
        if( $level < $threshold ) {
          opendir my $dh, $temp_path;
          my @new_paths = map { 
            catfile( $temp_path, $_ ) 
            } grep { ! /^\.\.?\z/ } readdir $dh;
          
          if( $which_first eq 'depth-first' ) {
            unshift @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
          } 
          else {  # breadth-first
            push @queue, map { [$_, $level + 1, $hash ] } @new_paths;
          }
        }
        $hash;
      }
    };
  }

  return $data;
}


my $depth = data_for_path( '.' , 2, 'depth-first' );

my $breadth = data_for_path( '.' , 2, 'breadth-first' );

print "path='.', level=2, method=depth_first:\n";
print Dumper($depth);
print "path='.', level=2, method=breadth_first:\n";
print Dumper($breadth);
