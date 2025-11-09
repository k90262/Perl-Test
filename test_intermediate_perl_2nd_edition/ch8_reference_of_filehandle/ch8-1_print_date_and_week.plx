#!/usr/bin/perl -w
use strict;

print 'Which type output do you want to choose? 1. save as a file, 2. save as a variable. 3. both. [1/2/3]: ';
my $choose = <STDIN>;
goodbye() unless $choose == 1 or $choose == 2 or $choose == 3;

sub goodbye {
  print 'Please choose 1, 2, or 3.', $/;
  exit;
}

print `date`; # TODO: implement IO::Handle/open/IO:file for chosse 1, 2, or 3 (ref. chapter for 'IO::Tee module'at p.129,  zh-tw ver. )
