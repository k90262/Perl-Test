#!/usr/bin/perl -w
use strict;
use v5.10.1;
use Regexp::Assemble;

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

my $ra = Regexp::Assemble->new;
foreach my $pattern (@patterns) {
  $ra->add( "$pattern" );
}
my $result_pattern = $ra->re;
print $result_pattern , "\n";

# Get string to compare
# print "Please key in the string to compare with the content of IO file:";

while(<>){
  chomp;
  if($_ =~ m/$result_pattern/) {
    #print "hi";
    print "Line $.:\'$_\' \t is matched to \t pattern \'$result_pattern\'!\n";
  }
}


