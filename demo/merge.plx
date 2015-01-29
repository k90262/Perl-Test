#!/usr/bin/perl -w
use strict;

############
# merge.plx
# to merge four locales files to a table which could open by excel.
#
# example:
# perl merge.plx > result.txt 2> result.log
#
###########

#Input files
my @file_paths = qw(en_US/bbbResources.properties ja_JP/bbbResources.properties zh_CN/bbbResources.properties zh_TW/bbbResources.properties);
my @file_labels = map { /(^.*?)\// ? $1 : $_ } @file_paths;
print "@file_labels\n";

my $null_lines_number = 0;
my $real_data_number = 0;
my $unknow_number = 0;
my $structure = {};

#Foreach file to add locale data to structure
for(my $n = 0; $n < @file_paths; $n++) {
  print "$file_paths[$n]\n"; #debug 
  open(my $fh, "<" , "$file_paths[$n]") 
	or die "can not open file $file_paths[$n]: $!\n";
  
  my $mylabel = $file_labels[$n];
  print "$file_labels[$n]:\n";

  my @input_lines = <$fh>;
  my $input_lines_number = @input_lines;
  print "Input line number: $input_lines_number \n";

  foreach(@input_lines) {
    chomp;
    if(/^\s+$/) {
      $null_lines_number++;
    }
    elsif(/(^.*?)( ?= ?)(.*$)/) {
      $real_data_number++;
      #print "$3\n";
      
      if(!defined $structure->{$1}) { # undeclare
        $structure->{$1} = { "$mylabel" => "$3"};
      }
      else { # declare, then add the key and value
        $structure->{$1}->{$mylabel} = $3;
      }

      #print "$structure->{$1}->{$mylabel}\n"; # debug
    }
    else {
      $unknow_number++;
      print "Unknow data: $_";
    }
  }

  close($fh) or warn "close fail: $!"; 
}

my $total_lines_number = $null_lines_number + $real_data_number + $unknow_number;
print "The number of null lines:\t$null_lines_number\n";
print "The number of read data:\t$real_data_number\n";
print "The number of unknow lines:\t$unknow_number\n";
print "\nTotal: $total_lines_number\n";

#Output report
open(my $fh2, ">", "merge_output.xls") or die "Error: can'not open merge_output.txt: $!";

print $fh2 "Locale_code\t$file_labels[0]\t$file_labels[1]\t$file_labels[2]\t$file_labels[3]\t\n";
foreach my $locale_code (keys %{$structure}) {
  print $fh2 "$locale_code\t";
  foreach (0..3) {
    my $nowlabel = $file_labels[$_];
    print $fh2 "$structure->{$locale_code}->{$nowlabel}\t";
  }
  print $fh2 "\n";
}

close($fh2);
