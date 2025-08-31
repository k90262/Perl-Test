#!perl

use strict;
use warnings;
use utf8;

use File::Find;
use Time::Local;

=pod

=head1 Call gather_mtime_between

=head2 Usage Example

  $ perl call_gather_mtime_between.plx 
  Mon Sep  1 00:49:22 2025: .
  Mon Sep  1 00:13:44 2025: ./modified_file.txt
  Mon Sep  1 00:48:26 2025: ./call_gather_mtime_between.plx

=cut

my $target_dow = 1;        # Sunday is 0, Monday is 1, ...
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my($sec, $min, $hour, $day, $mon, $yr, $dow) = localtime;
my $start = timelocal(0, 0, 0, $day, $mon, $yr);        # midnight today

while ($dow != $target_dow) {
  # Back up one day
  $start -= $seconds_per_day;        # hope no DST! :-)
  if (--$dow < 0) {
    $dow += 7;
  }
}
my $stop = $start + $seconds_per_day;

my($gather, $yield)  = gather_mtime_between($start, $stop);
find($gather, @starting_directories);
my @files = $yield->(  );


sub gather_mtime_between {
  my($begin, $end) = @_;
  my @files;
  my $gatherer = sub {
    my $timestamp = (stat $_)[9];
    unless (defined $timestamp) {
      warn "Can't stat $File::Find::name: $!, skipping\n";
      return;
    }
    push @files, $File::Find::name
      if $timestamp >= $begin and $timestamp <= $end;
  };
  my $fetcher = sub { 
    for my $file (@files) {
      my $mtime = (stat $file)[9];        # mtime via slice
      my $when = localtime $mtime;
      print "$when: $file\n";
    }
    @files; 
  };
  ($gatherer, $fetcher);
}
