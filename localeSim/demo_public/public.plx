#!/usr/bin/perl -w
use strict;

############
# public.plx
# to use modified table to public the four locales files.
#
# example:
# perl public.plx excel_cp.txt 
#
############

my @total_lines = <>;
my $line_count = 0;

#print "$total_lines[0]"; #debug
chomp(my $labes_line = $total_lines[0]);
#print "$labes_line\n"; # debug
my @labels = split (/ *\t+ */, $labes_line); # 1. get lables from first line
#print "@labels\n"; # debug
#print "$labels[1], $labels[2], $labels[3], $labels[4]\n";

# 2. open files by labes
open (my $fh1, ">", "$labels[1].final.txt") or die "Can not open $labels[1].final.txt:$!";
open (my $fh2, ">", "$labels[2].final.txt") or die "Can not open $labels[2].final.txt:$!";
open (my $fh3, ">", "$labels[3].final.txt") or die "Can not open $labels[3].final.txt:$!";
open (my $fh4, ">", "$labels[4].final.txt") or die "Can not open $labels[4].final.txt:$!";

foreach (@total_lines) {
  $line_count++;
  next if $line_count == 1; # skip first line which are labels.
  next if /^\s+$/;	    # skip the black line
  
  chomp;
  my @locales = split (/ *\t+ */, $_);
  warn "[WARN] $locales[0] may loss one of the loacle infos of US, JP, CN, TW: $!" if @locales != 5; 
  print $fh1 "$locales[0] = $locales[1]\n"; # 3. print their infos to their files. 
  print $fh2 "$locales[0] = $locales[2]\n";
  print $fh3 "$locales[0] = $locales[3]\n";
  print $fh4 "$locales[0] = $locales[4]\n";

}

# 4. close files
close $fh1 or warn "Close failed:$!";
close $fh2 or warn "Close failed:$!";
close $fh3 or warn "Close failed:$!";
close $fh4 or warn "Close failed:$!";
