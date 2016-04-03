#!/usr/bin/perl -w
use strict;
use File::Basename;
use File::Spec::Functions;
use Data::Dumper;

sub data_for_path {
  my($start_path, $threshold, $type) = @_;
  my $coderef = $type eq 'depth-first' ? \&add_to_front : \&add_to_end;

  my $data = {};

  my @queue = ( [ $start_path, 0, $data ] );

  while( my $next = shift @queue) {
    my( $path, $level, $ref ) = @$next;

    my $basename = basename( $path );
    
    $ref->{$basename} = do {
      if( -l $path or -f $path ) { undef }
      else {
         my $hash = {};
         if( $level < $threshold ) {
           opendir my $dh, $path;
           my @new_paths = map {
             catfile( $path, $_)
           } grep { ! /^\.\.?\z/ } readdir $dh;
           $coderef->( \@queue, $level, $hash, \@new_paths);
         }
         $hash;
      }
    };
  }
  $data;
}

sub add_to_front {
  #print "add_to_front\n";
  my( $queue, $level, $hash, $new_paths ) = @_;
  unshift @$queue, map { [ $_, $level + 1, $hash ] } @$new_paths;
}

sub add_to_end {
  #print "add_to_end\n";
  my( $queue, $level, $hash, $new_paths ) = @_;
  push @$queue, map { [ $_, $level + 1, $hash ] } @$new_paths;
}

my $depth = data_for_path( '.' , 2, 'depth-first' );

my $breadth = data_for_path( '.' , 2, 'breadth-first' );

print "path='.', level=2, method=depth_first:\n";
print Dumper($depth);
print "path='.', level=2, method=breadth_first:\n";
print Dumper($breadth);
