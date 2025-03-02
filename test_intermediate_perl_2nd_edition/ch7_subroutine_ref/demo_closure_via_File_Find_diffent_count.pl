#!/usr/bin/perl -w
use strict;
use File::Find;

=pod

=head1 SYNOPSIS

  perl demo_closure_via_File_Find_diffent_count.pl

=cut
sub create_find_callback_that_counts{
  my $count = 0;
  return sub {
    my $size = -f ? -s : -1;
    my $msg = ($size > -1) ? 
      "(File Size: $size)" : 
      "(Not a File)      ";
    print ++$count, ":\t$msg\t$File::Find::name$/"; 
  };
}
my $callback1 = create_find_callback_that_counts();
my $callback2 = create_find_callback_that_counts();
print "my bin:\n";
find($callback1, '/Users/apple/bin');
print "my lib:\n";
find($callback2, '/Users/apple/lib');

