#!/usr/bin/perl -w
use strict;

open my $fh, '<', 'patterns.txt' 
  or die "Could not open file: $!";

my @patterns;

while (<$fh>) {
  chomp;
  my $pattern = eval { qr/$_/ } or die "Invalid regex pattern '$_': $@";
  push @patterns, $pattern;
}

while (<>) {
  foreach my $pattern (@patterns) {
    if (/$pattern/) {
      print "Match of [$pattern] at line $. | $_\n";
      last; # Stop checking other patterns if a match is found
    }
  }
}

=pod 

=head1 Name

grepByPattern.pl - A Perl script to match lines against regular expression patterns from a file.

=head1 Description

This Perl script reads regular expression patterns from a file named 'patterns.txt' and then checks each line of input (from standard input or files specified as command-line arguments) against those patterns. If a line matches any of the patterns, it prints the matching pattern, the line number, and the line itself.
The script uses the 'qr' operator to compile the regular expressions, which allows for more efficient matching. It also includes error handling to catch invalid regex patterns and will print an error message if a pattern cannot be compiled.

=head1 Usage

To use this script, you can run it from the command line and provide input either through a file or by typing directly into the terminal. For example:
perl grepByPattern.pl input.txt
or
perl grepByPattern.pl < input.txt
or
perl grepByPattern.pl (and then type lines directly, ending with Ctrl+D on Unix/Linux or Ctrl+Z on Windows

=head1 Note

Make sure to have a 'patterns.txt' file in the same directory as the script, containing the regular expression patterns you want to use for matching.

=head2 Example of 'patterns.txt' content:

^Error
^Warning
\d{4}-\d{2}-\d{2}

=head1 Author

Bill Ho 
Copilot

2026-05-04.

=cut
