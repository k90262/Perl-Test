#!/usr/bin/perl -w
use strict;

local $/ = undef; #TODO: modified to '$/ = ""' version

#while (<>) {
  my $lines = <>;
  
  print $lines;

my $n = 0;
#   my @total = ($lines =~ s/^(.*)/: $1/mg);
#   my $count = length @total;
#   print $count, "\n";
#   print $total[0];
#   print $total[1];
# #  my $count = @total;
# #  for (my $i=1; $i<=$count; $i++){
# #    print $i-1, "\n";
# #    #print $total[$i-1], "\n";
# #    my $line = @total[$i-1];
# #    print $line, "\n";
# #    print "$i"."$line";
# #  }
#   foreach my $l (@total){
#     print $l;
#   }
#   #print $lines

while ($lines =~ /^(.*)/mg) {
  print ++$n, ":\t";
  print $1, "\n";
}
#};
