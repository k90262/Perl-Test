#!/usr/bin/perl -w
use strict;

# IO process
open my $fh, '<', "ch9-2_patterns.txt"
  or die "Failed to open pattern.txt: $!";

my @patterns = ();

while(<$fh>) {
  chomp $_;
  push @patterns, $_;
}
print "@patterns\n";

close $fh;

# Change to qr// pattern
my @qr_patterns = ();

foreach my $pattern (@patterns) {
  my $qr_pattern = eval { qr/$pattern/ } 
    or do {warn "$pattern is not a regex format: $@"; next};
  push @qr_patterns, $qr_pattern;
}
print "@qr_patterns\n";

# Get string to compare
# print "Please key in the string to compare with the content of IO file:";
my $array_index = 0;

while(<>){
  chomp;
  $array_index = 0;
  foreach my $qr_pattern (@qr_patterns) {
    if($_ =~ m/$qr_pattern/) {
      print "$.:\'$_\' \t is matched to \t pattern $array_index:\'$qr_pattern\'!\n";
    }
    $array_index++;
  }
}


