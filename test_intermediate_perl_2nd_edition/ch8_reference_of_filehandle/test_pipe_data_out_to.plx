#!/usr/bin/perl -w
use strict;

=pod

=head1 test_pipe_data_out_to.plx

=head2 Equal to

  my $command = "say"; # macOS command: convert input text to audible speech
  open my $pipe, "| $command"
    or die "Coudle not open filehandle: $!";
  
  foreach ( 1 .. 10 ) {
    print $pipe "I can count to $_\n";
  }

=cut

use IO::Pipe;

my $pipe = IO::Pipe->new;
my $command = "say"; # macOS command: convert input text to audible speech

$pipe->writer( $command );


foreach ( 1 .. 10 ) {
  print $pipe "I can count to $_\n";
}
