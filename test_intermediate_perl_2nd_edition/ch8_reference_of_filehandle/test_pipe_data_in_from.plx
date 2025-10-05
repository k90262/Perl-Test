#!/usr/bin/perl -w
use strict;

=pod

=head1 test_pipe_data_in_from.plx

  # SAME AS CODE: 
  my $command = "$^X -V";
  
  open my $pipe, '-|', $command
    or die "Could not open filehandle: $!";
  
  while( <$pipe> ) {
    print "Read: $_";
  }
  
  close $pipe;

=head2 Usage Example

  $ perl test_pipe_data_in_from.plx
  Read: Summary of my perl5 (revision 5 version 32 subversion 0) configuration:
  Read:    
  Read:   Platform:
  Read:     osname=darwin
  Read:     osvers=21.6.0
  Read:     archname=darwin-2level
  Read:     uname='darwin ychos-macbook-pro.local 21.6.0 darwin kernel version 21.6.0: mon aug 22 20:17:10 pdt 2022; root:xnu-8020.140.49~2release_x86_64 x86_64 '
  Read:     config_args='-de -Dprefix=/Users/apple/perl5/perlbrew/perls/perl-5.32.0 -Aeval:scriptdir=/Users/apple/perl5/perlbrew/perls/perl-5.32.0/bin'
  Read:     hint=recommended
  Read:     useposix=true
  ...
=cut


use IO::Pipe;

my $pipe = IO::Pipe->new;

$pipe->reader( "$^X -V" );

while(<$pipe>) {
  print "Read: $_";
}
