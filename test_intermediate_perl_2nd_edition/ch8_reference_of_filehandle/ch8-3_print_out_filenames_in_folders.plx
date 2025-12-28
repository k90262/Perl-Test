#!/usr/bin/perl
use strict;

=pod

=head1 ch8-3_print_out_filenames_in_folders.plx

=head2 Example

  $ perl ch8-3_print_out_filenames_in_folders.plx . .. not_dir
  not_dir is not a directory!
  ch8-2_input.missing_name.txt
  ch8-3_print_out_filenames_in_folders.plx
  ch8-1_print_date_and_week.plx
  ch8-1_answer.plx.out
  test_pipe_data_in_from.plx
  ..

=head2 Description

Print out the filenames in the directories passed as arguments.

=head2 Usage

  perl ch8-3_print_out_filenames_in_folders.plx dir1 dir2 ...

=head2 Arguments

=over 4

=item dir1 dir2 ...

Directories to print out the filenames contained in them.

=back

=head2 Requirements

Perl 5

=cut


my @not_dirs = grep { ! -d } @ARGV;
foreach my $not_dir ( @not_dirs ) {
  print "$not_dir is not a directory!\n";
}

my @dirs = grep { -d } @ARGV;

my @dir_hs = map { opendir my $dh, $_ or warn "$_ cannot be open directory: $!"; $dh } @dirs;

foreach my $dh ( @dir_hs ) { print_contents( $dh ) };

sub print_contents {
  my $dh = shift;

  while ( my $file = readdir $dh ) {
    next if( $file eq '.' or $file eq '..' );
    print "$file\n";
  }
}
