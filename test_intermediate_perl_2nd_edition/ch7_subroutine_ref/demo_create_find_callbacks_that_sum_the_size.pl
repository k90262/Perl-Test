#!/usr/bin/perl -w
use strict;
use File::Find;

=pod

=head1 SYNOPSIS

  perl demo_create_find_callbacks_that_sum_the_size.pl

=head2 Example

  $ perl demo_create_find_callbacks_that_sum_the_size.pl
  bin has 5 bytes
  lib has 0 bytes
  man has 0 bytes

=cut

sub create_find_callbacks_that_sum_the_size {
  my $total_size = 0;
  return (sub { $total_size += -s if -f }, sub { return $total_size });
}

#my ($count_em, $get_results) = create_find_callbacks_that_sum_the_size();
#find($count_em, 'bin');
#my $total_size = &$get_results();
#print "total size of bin is $total_size\n";

my %subs;
foreach my $dir (qw(bin lib man)) {
  my ($callback, $getter) = create_find_callbacks_that_sum_the_size( );
  $subs{$dir}{CALLBACK} = $callback;
  $subs{$dir}{GETTER} = $getter;
}

for (keys %subs) {
  find($subs{$_}{CALLBACK}, $_);
}

for (sort keys %subs) {
  my $sum = $subs{$_}{GETTER}->( );
  print "$_ has $sum bytes\n";
}
