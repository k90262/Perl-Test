#!perl

use strict;
use warnings;
use utf8;

use File::Find;
use Time::Local;
use File::Spec::Functions qw(canonpath no_upwards);
my $target_dow = 6;        # Sunday is 0, Monday is 1, ...
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my($sec, $min, $hour, $day, $mon, $yr, $dow) = localtime;
my $start = timelocal(0, 0, 0, $day, $mon, $yr);        # midnight today

sub gather_mtime_between {
	my $dstart = shift;
	my $dstop  = shift;
	my @mfiles = ();
	
	return 
		sub { #print $_, "\n";
				my $mtime = (stat $_)[9];
				unless (defined $mtime) {
				 warn "GG";
				 return;
				}
				push @mfiles, canonpath( $File::Find::name ) 
					if $mtime >= $dstart and $mtime <= $dstop;
			}, 
		sub { @mfiles = no_upwards( @mfiles );
				wantarray ? @mfiles : [ @mfiles ];
			};
}

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

for my $file (@files) {
  my $mtime = (stat $file)[9];        # mtime via slice
  my $when = localtime $mtime;
  print "$when: $file\n";
}

<STDIN>
