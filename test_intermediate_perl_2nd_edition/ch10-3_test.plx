#!/usr/bin/perl -w
use strict;
#-----
my $string = 'Mary Ann';	
$string =~ tr/A-Z/a-z/;		# 強制全小寫
$string =~ tr/a-z//cd;		# 除了a到z以外，其他字符都刪除
print $string;				# 印出"maryann"
print "\n";
#-----

my $string_array = [ 'The Skipper', 'Marry Ann', 'The Professor'];
print "The sring array = @$string_array\n";

my @sorted = 
  map $_->[0],
  sort { $a->[1] cmp $b->[1] }
  map [$_, covertChar($_)], 
  @$string_array;

print "The sorted array = @sorted\n";
print "The sring array = @$string_array\n";
 
sub covertChar {
	my $str = shift @_;
	$str =~ tr/A-Z/a-z/;
	$str =~ tr/a-z//cd;
	return $str;
}