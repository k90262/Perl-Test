#! /usr/bin/perl
=pod

=head1 cvmap - consonat and vowel pattern map

=head2 Syntax

  $ perl cvmap.pl <template_string> [file_path_of_dictioin_of_string_you_want_comparing_with_cv_pattern]

=head2 Example

  $ perl cvmap.pl fortuitously ./usr/dict/wordses 
  REGEX is (?^i:^[cbdfghjklmnpqrstvwxzy][aeiouy][cbdfghjklmnpqrstvwxzy][cbdfghjklmnpqrstvwxzy][aeiouy][aeiouy][cbdfghjklmnpqrstvwxzy][aeiouy][aeiouy][cbdfghjklmnpqrstvwxzy][cbdfghjklmnpqrstvwxzy][aeiouycbdfghjklmnpqrstvwxzy]$)
  carriageable
  villainously

=cut

$vowels = 'aeiouy';
$cons = 'cbdfghjklmnpqrstvwxzy';
%map = (C => $cons, V => $vowels);
for $class ($vowels, $cons) {
  for (split //, $class) {
    $map{$_} .= $class;
  }
}
for $char (split //, shift) {
  $pat .= "[$map{$char}]";
}
$re = qr/^${pat}$/i;
print "REGEX is $re\n";
@ARGV = ('/usr/dict/words') 
	if -t && !@ARGV;
while (<>) {
  print if /$re/;
}
