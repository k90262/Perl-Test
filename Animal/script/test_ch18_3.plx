#!/usr/bin/perl -w
use strict;
use Horse;

my @tv_horses = map { Horse->named($_) } ('Tigger', 'Mr. Ed');
$_->eat('an apple') for @tv_horses; # 他們的最後一餐
print "End of program.\n"
