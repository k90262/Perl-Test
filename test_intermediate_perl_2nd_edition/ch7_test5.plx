#!/usr/bin/perl -w
use strict;

# count_one();

# {
# my $count;
# sub count_one { ++$count };
# sub count_so_far { return $count };
# }

# count_one();
# count_one();
# count_one();
# print "we have seen ", count_so_far(), " coconuts!\n";

# count_down();
# print "we're down to ", count_remaining(), " coconuts!\n";

# BEGIN {
# my $countdown = 10;
# sub count_down { $countdown-- }
# sub count_remaining { return $countdown }
# }

# count_down();
# count_down();
# count_down();
# print "we're down to ", count_remaining(), " coconuts!\n";

# use v5.10;
# sub countdown {
  # state $countdown = 10;
  # $countdown--;
  # print "we're down to ", $countdown, " coconuts!\n";
# }
# countdown();
# countdown();

# use v5.10;

# my @array = qw( a b c d e f 1 2 3 );

# print sort {
  # state $n = 0;
  # print $n++, ": a[$a] b[$b]\n";
  # $a cmp $b;
  # } @array;
  
 # use v5.10;
 
 # my @sorted_lines_tuples = 
  # sort { $a->[1] cmp $b->[1] } 
  # map { state $l = 0; [ $l++, $_]} 
  # qw( a b c d e f 1 2 3);
  
 # for my $v (@sorted_lines_tuples) {
   # print $v->[0], " ", $v->[1], "\n";
 # }
 
 # use v5.10;
 
 # sub add_to_tab {
   # my $castaway = shift;
   # state $castaways = [ qw(Ginger Mary Ann Gilligan) ];
   # state $tab = { map { $_, 0 } @$castaways };
   # $tab->{$castaway}++;
 # }
 
 # print add_to_tab("Ginger"), "\n";
 # print add_to_tab("Ginger"), "\n";
 # print add_to_tab("Ginger"), "\n";
 # use v5.16;
 
 # my $countdown;
 # my $n = 5;
 # $countdown = sub {  
   # return unless $n > -1;
   # print $n--, "\n";
   ##$countdown->();
   # __SUB__->();
 # };
 # $countdown->();
 # say $n;
 
 use v5.16;
 
 sub countdown {
   state $n = 5;
   return unless $n > -1;
   say $n--;
   __SUB__->();
 }
 countdown();
<STDIN>