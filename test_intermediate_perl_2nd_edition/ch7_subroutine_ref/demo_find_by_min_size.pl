#!/usr/bin/perl -w
#use strict;
use File::Find;
use File::Spec::Functions qw(canonpath no_upwards);

=pod

=head1 SYNOPSIS

  perl demo_find_by_min_size.pl

=head2 Example

  $ perl demo_find_by_min_size.pl
  bin/output.dat

=cut

sub find_by_min_size {
  my $min = shift;
  
  my @files = ();

  sub { push @files, canonpath( $File::Find::name ) 
    if -s $_ >= $min},
  sub { @files = no_upwards( @files );
    wantarrary ? @files : [ @files] }
}

my ($callback, $reporter) = find_by_min_size(1024);
find($callback, 'bin');

my @files_found = $reporter->();
print @files_found, "\n";
