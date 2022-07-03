#!/usr/bin/perl -w
use strict;

=pod

=head2

perl ./ch5.6.5_slash_G_assertion.pl

=cut

my $recipe;
($recipe = <<'DISH') =~ s/^\es+//gm;
  Preheat oven to 451 deg. fahrenheit.
  Mix 1 ml. dilithium with 3 oz. NaCl and 
  stir in 4 anchovies. Glaze with 1 g. 
  mercury. Heat for 4 hours and let cool
  for 3 seconds. Serves 10 aliens.
DISH

print "\$recipe:\n$recipe\n";

print '$recipe =~ /\d+ /g;',"\n";
print '$recipe =~/\G(\w+)/;', "\n";
$recipe =~ /\d+ /g;
$recipe =~/\G(\w+)/;     # $1 現在是 "deg"
print "=> \$1 = $1\n";

print '$recipe =~ /\d+ /g;', "\n";
print '$recipe =~/\G(\w+)/;', "\n";
$recipe =~ /\d+ /g;
$recipe =~/\G(\w+)/;     # $1 現在是 "ml"
print "=> \$1 = $1\n";

print '$recipe =~ /\d+ /g;', "\n";
print '$recipe =~/\G(\w+)/;', "\n";
$recipe =~ /\d+ /g;
$recipe =~/\G(\w+)/;     # $1 現在是 "oz"
print "=> \$1 = $1\n";

print "\n==========================\n";

pos($recipe) = 0;					# 為安全起見，將 \G 重置為0
while ( $recipe =~ /(\d+) /g) {
  my $amount = $1;
  if ($recipe =~ / \G (\w{0,3}+) \. \s+ (\w+) /x) {	# 縮寫 . + 單字
    print "$amount $1 of $2\n";
  } else {
    $recipe =~ / \G (\w+) /x;				# 只要一個單子、
    print "$amount $1\n";
  }
}
