#!/usr/bin/perl -w
use strict;

# use IO::Null;

# my $null_fh = IO::Null->new;

# some_printing_thing( $null_fh, @ARGV );

# sub some_printing_thing {
  # my $fh = shift;
  # $fh->print( "@_\n" );
  # print "test: @_\n";
# }

# use IO::Interactive qw(interactive);

# print { interactive } 'Bamboo car frame';

use IO::Null;

my $Debug = 1;

my $debug_fh = $Debug ? *STDOUT : IO::Null->new;

$debug_fh->print( "Hey, the radio's not working!" );
<STDIN>