#!/usr/bin/perl -w
use strict;

=pod


=head2 test case: 

perl ch5_regex_position.pl ch5_regex_m.pl

=head2 result

 <p>#!/usr/bin/perl -w
 use strict;
 
 <\p>
 <p># case array context
 my $paragrapth = "Perl is a program that use perl language to write perl document.";
 my @perls;
 if (@perls = $paragrapth =~ /perl/gi)
 {
   printf "Perl methioned  %d times.\n", scalar @perls;
 }
 
 <\p>
 <p># case covert to hash by quote of regex
 my $string = "password=xyxxz verbose=9 score=0";
 my %hash;
 %hash = $string =~ /(\w+)=(\w+)/g;
 foreach my $key (keys %hash)
 {
   print "hash.$key=".$hash{$key}."\n";
 }
 
 <\p>
 <p># case m??
 my @words = qw(neurad neureee neurpnology);
 my ($first, $last);
 while (@words)
 {
   $_ = shift @words;
   $first = $1 if m?^(neur\w*)?;
   $last  = $1 if m/^(neur\w*)/;
 }
 print "first: $first\n";
 print "last : $last\n";
 
 <\p>
 1:	<p>#!/usr/bin/perl -w
 2:	use strict;
 3:	
 4:	<\p>
 5:	<p># case array context
 6:	my $paragrapth = "Perl is a program that use perl language to write perl document.";
 7:	my @perls;
 8:	if (@perls = $paragrapth =~ /perl/gi)
 9:	{
 10:	  printf "Perl methioned  %d times.\n", scalar @perls;
 11:	}
 12:	
 13:	<\p>
 14:	<p># case covert to hash by quote of regex
 15:	my $string = "password=xyxxz verbose=9 score=0";
 16:	my %hash;
 17:	%hash = $string =~ /(\w+)=(\w+)/g;
 18:	foreach my $key (keys %hash)
 19:	{
 20:	  print "hash.$key=".$hash{$key}."\n";
 21:	}
 22:	
 23:	<\p>
 24:	<p># case m??
 25:	my @words = qw(neurad neureee neurpnology);
 26:	my ($first, $last);
 27:	while (@words)
 28:	{
 29:	  $_ = shift @words;
 30:	  $first = $1 if m?^(neur\w*)?;
 31:	  $last  = $1 if m/^(neur\w*)/;
 32:	}
 33:	print "first: $first\n";
 34:	print "last : $last\n";
 35:	
 36:	<\p>
=cut

local $/ = ""; # 段落模式

my $n = 0;
my $total_lines;

while (<>) {
  my $lines = '<p>'.$_.'<\p>'."\n";
  
  print $lines;
  $total_lines .= $lines;
};

while ($total_lines =~ /^(.*)/mg) {
  print ++$n, ":\t";
  print $1, "\n";
}
