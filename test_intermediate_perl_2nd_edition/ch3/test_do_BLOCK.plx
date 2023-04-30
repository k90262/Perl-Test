#!/usr/bin/perl -w
use strict;

=pod

=head1 Test do BLOCK

=head2 Syntax

  perl test_do_BLOCK.plx

=head2 Result Sample

  ------------ case 1. ------------
  Enter 1, 2, or 3: 2
  2
  
  Ginger
  ----------------------------------
  --------------case 2. ------------
  FILE NAME: test_do_BLOCK.plx
  FILE CONTENTS:
  #!/usr/bin/perl -w
  use strict;
  
  =pod
  
  =head1 Test do BLOCK
  
  =head2 Syntax
  
    perl test_do_BLOCK.plx
  
  =cut
  
  =head3 case 1. Use do BLOCK to reduce variable-assign usage  when using if-elsif-else
  
  =cut
  
  
  print "------------ case 1. ------------\n";
  print "Enter 1, 2, or 3: ";
  my $ans = <STDIN>;
  
  print $ans, "\n";
  
  
  my $bowler = do {
    if ($ans eq "1\n")    { 'Mary_Ann' }
    elsif ($ans eq "2\n") { 'Ginger' }
    else                  { 'The Professor' }
  };
  
  print "$bowler\n";
  
  print "----------------------------------\n";
  
  =head3 case 2. Use do BLOCL as a scope
  
  =cut
  
  print "--------------case 2. ------------\n";
  my $filename = "test_do_BLOCK.plx";
  my $file_contents = do {
    local $/;
    local @ARGV = ( $filename );
    <>
  };
  
  print "FILE NAME: $filename\n";
  print "FILE CONTENTS:\n";
  print "$file_contents\n";
  print "----------------------------------\n";
  
  ----------------------------------

=head2 Deme case

=cut

=head3 case 1. Use do BLOCK to reduce variable-assign usage  when using if-elsif-else

=cut


print "------------ case 1. ------------\n";
print "Enter 1, 2, or 3: ";
my $ans = <STDIN>;

print $ans, "\n";


my $bowler = do {
  if ($ans eq "1\n")    { 'Mary_Ann' }
  elsif ($ans eq "2\n") { 'Ginger' }
  else                  { 'The Professor' }
};

print "$bowler\n";

print "----------------------------------\n";

=head3 case 2. Use do BLOCL as a scope

=cut

print "--------------case 2. ------------\n";
my $filename = "test_do_BLOCK.plx";
my $file_contents = do {
  local $/;
  local @ARGV = ( $filename );
  <>
};

print "FILE NAME: $filename\n";
print "FILE CONTENTS:\n";
print "$file_contents\n";
print "----------------------------------\n";
