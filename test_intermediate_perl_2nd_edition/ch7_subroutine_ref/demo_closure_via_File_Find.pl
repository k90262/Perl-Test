#!/usr/bin/perl -w
use strict;
use File::Find;

=pod

=head1 SYNOPSIS

  perl demo_closure_via_File_Find.pl

=cut
my $total_size = 0;
find(sub { $total_size += -s if -f }, '.');
print $total_size, "$/";


my $callback;
{
  my $count = 0;
  $callback = sub { 
    print ++$count, ": $File::Find::name"; 
    if (-f) { 
      print "\t(File Size: ", -s, ")$/"; 
    } 
    else { 
      print "\t(Not a File)$/"; 
    } 
  };
}
find($callback, '.');
