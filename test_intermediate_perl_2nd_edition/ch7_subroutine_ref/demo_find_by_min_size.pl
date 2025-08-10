#!/usr/bin/perl -w
#use strict;
use File::Find;
use File::Spec::Functions qw(canonpath no_upwards);

=pod

=head1 SYNOPSIS

  perl demo_find_by_min_size.pl target_folder_path min_size

=head2 Example

  $ perl demo_find_by_min_size.pl bin 1024
  bin/output.dat

=cut

sub find_by_min_size {
  my $min = shift;
  
  my @files = ();

  sub { push @files, canonpath( $File::Find::name ) 
    if -s $_ >= $min},
  sub { @files = no_upwards( @files );
    wantarry? @files : [ @files] }
}

my ($callback, $reporter) = find_by_min_size($ARGV[1]);
find($callback, $ARGV[0]);

my @files_found = $reporter->();
print join("\n", @files_found), "\n";
