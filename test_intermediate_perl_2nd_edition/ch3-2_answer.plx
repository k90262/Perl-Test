#!/usr/bin/perl -w

chdir; # 進入家目錄

while( 1 ) {
  print "Please enter a regular expression> ";
  chomp( my $regex = <STDIN> );
  last unless( defined $regex && length $regex );

  print 
    map { "    $_\n" } 
    grep { eval{ /$regex/ } }
    glob( ".* *" );
}
