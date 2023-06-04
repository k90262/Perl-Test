#!/usr/bin/perl -w
use strict;

=pod

=head1 ch3-1_print_filenames_whichs_size_smaller_than_1000_byte.plx

=head2 Syntax

  $ perl ch3-1_print_filenames_whichs_size_smaller_than_1000_byte.plx <list_of_file_name>

=head2 Example

  $ perl ch3-1_print_filenames_whichs_size_smaller_than_1000_byte.plx *
  smaller_than_1000:
      249 bytes	ch3-1_print_filenames_whichs_size_smaller_than_1000_byte.plx

=cut

#print map { "    $_\n" } @ARGV;

# use file test operator -s
my @smaller_than_1000 = grep { (-s $_) <  1000} @ARGV;
print 'smaller_than_1000:', "\n";
print map { "    ".(-s $_). " bytes\t$_\n" } @smaller_than_1000;

