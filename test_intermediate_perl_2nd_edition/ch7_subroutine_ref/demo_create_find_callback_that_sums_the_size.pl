#!/usr/bin/perl -w
use strict;
use File::Find;

=pod

=head1 SYNOPSIS

  perl demo_create_find_callback_that_sums_the_size.pl

=head2 Example

  $ perl demo_create_find_callback_that_sums_the_size.pl
  total size of bin is 5

=cut

sub create_find_callback_that_sums_the_size {
  my $total_size = 0;
  return sub {
    if (@_) {
      return $total_size;
    } else {
      $total_size += -s if -f 
    }
  };
}

my $callback = create_find_callback_that_sums_the_size();
find($callback, 'bin');
my $total_size = $callback->('dummy');
print "total size of bin is $total_size\n";
