#!/usr/bin/perl -w
use strict;
#use re "debug";

$_ = << 'HEREDOC';
Paris in THE THE THE THE sprint.
The clothes you DON DON't fit. 
Want to keep that that particular.
Want to keep that that notation..
HEREDOC

# delete repeat words
#1 while s/\b(\w+) \1\b/$1/gi;

# use lookahead
#s/ \b (\w+) \s (?= \1\b) //gxi;

# updated with negative lookahead
#s/ \b (\w+) \s (?= \1\b (?! '\w)) //gxi;

# updated with negative lookahead - 2
my @thatthat = qw(particular notation);
local $" = '|';
s/ \b (\w+) \s (?= \1\b (?! '\w | \s (?: @thatthat ))) //gxi;



print "After delete repeat works: $_\n";
