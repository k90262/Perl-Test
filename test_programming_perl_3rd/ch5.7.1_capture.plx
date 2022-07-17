#!/usr/bin/perl -w
use strict;

(my $content = <<'MAIL_HEADER') =~ s/^\s+//gm;
  From: gnat@perl.com
  To: camelot@oreilly.com
  Date: Mon, 17 Jul 2000, 09:00:00 -1000
  Subject: Eye of the needle
MAIL_HEADER

print '$content = ', "\n"
	, $content;

$_ = $content;

my %fields = /^(.*?): (.*)$/gm;

print "\n";

foreach my $t (sort keys %fields) {
  print '$fields{', $t, '} = ', "$fields{$t}\n";
}

print "\n\n----------------------------------\n\n";

$_ = "Bilbo Baggins";
print "\$contetn = $_\n\n";
my($full, $first, $last) = /^((\w+) (\w+))$/;
print "\$full = $full, \$first = $first, \$last = $last\n";

print "\n\n----------------------------------\n\n";

$_ = "Speak, <EM>friend</EM>, and enter";
print "\$contetn = $_\n\n";
m[ (<.*?>) (.*?) (</.*?>) ]x;	# 比對一個標記，然後是字符，之後是結束標記
print "prematch: $`\n";      	# Speak,
print "match: $&\n";        	# <EN>friend</EN>
print "postmatch: $'\n";	# , and enter
print "lastmatch: $+\n";	# </EN>

print "\n\n----------------------------------\n\n";

# @- equal @LAST_MATCH_START
# @+ equal @LAST_MATCH_END
my $alphabet = "abcdefghijklmnopqrstuvwxyz";
$alphabet =~ "(hi).*(stu)";
print '=== my $alphabet = "abcdefghijklmnopqrstuvwxyz";', "\n";
print '=== $alphabet =~ "(hi).*(stu)";', "\n";
print "The entire match began at $-[0] and ended at $+[0]\n";
print "The first match began at $-[1] and ended at $+[1]\n";
print "The second match began at $-[2] and ended at $+[2]\n";

=pod

=head2

$ perl ch5.7.1_capture.plx

  $content = 
  From: gnat@perl.com
  To: camelot@oreilly.com
  Date: Mon, 17 Jul 2000, 09:00:00 -1000
  Subject: Eye of the needle
  
  $fields{Date} = Mon, 17 Jul 2000, 09:00:00 -1000
  $fields{From} = gnat@perl.com
  $fields{Subject} = Eye of the needle
  $fields{To} = camelot@oreilly.com
  
  
  ----------------------------------
  
  $contetn = Bilbo Baggins
  
  $full = Bilbo Baggins, $first = Bilbo, $last = Baggins
  
  
  ----------------------------------
  
  $contetn = Speak, <EM>friend</EM>, and enter
  
  prematch: Speak, 
  match: <EM>friend</EM>
  postmatch: , and enter
  lastmatch: </EM>

  ----------------------------------
  
  === my $alphabet = "abcdefghijklmnopqrstuvwxyz";
  === $alphabet =~ "(hi).*(stu)";
  The entire match began at 7 and ended at 21
  The first match began at 7 and ended at 9
  The second match began at 18 and ended at 21

=cut
