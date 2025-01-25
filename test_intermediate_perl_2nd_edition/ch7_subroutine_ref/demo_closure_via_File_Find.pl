#!/usr/bin/perl -w
use strict;
use File::Find;

=pod

=head1 SYNOPSIS

  perl demo_closure_via_File_Find.pl

=cut
my $total_size = 0;
find(sub { $total_size += -s if -f }, '.');
print "Total Files Bytes: $total_size$/";
print "------------------------$/";

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
my $callback = create_find_callback_that_counts();
find($callback, '.');
