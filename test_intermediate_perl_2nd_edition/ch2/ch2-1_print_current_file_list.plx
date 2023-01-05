#!/usr/bin/perl -w
use strict;
use Cwd;
use File::Spec;

my $cwd = cwd();
print "pwd: ", $cwd, "\n";
print 'glob("*")', ":\n";
print "-------------\n";

my @current_filename = glob("* .*");

foreach my $filename (@current_filename) 
{
  my $full_path_filename = File::Spec->catfile($cwd, $filename);
  print "    $full_path_filename\n";
}
