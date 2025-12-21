#!/usr/bin/perl -w
use strict;
use IO::File;

=pod

=head1 ch8-1_print_date_and_week - Save output into file, scalar, or both.

=head2 Sypnosis

  $ perl ch8-1_print_date_and_week.plx
  Which type output do you want to choose? 1. save as a file, 2. save as a variable. 3. both. [1/2/3]: 1
  ---------------------------------
  Final result in ch8-1_output.txt:
  2025年11月16日 週日 23時44分24秒 CST
  2025年11月16日 週日 23時46分13秒 CST

  $ perl ch8-1_print_date_and_week.plx
  Which type output do you want to choose? 1. save as a file, 2. save as a variable. 3. both. [1/2/3]: 2
  ---------------------------------
  Final result in $string: 2025年11月16日 週日 23時46分44秒 CST
  
  $ perl ch8-1_print_date_and_week.plx
  Which type output do you want to choose? 1. save as a file, 2. save as a variable. 3. both. [1/2/3]: 3
  ---------------------------------
  Final result in ch8-1_output.txt:
  2025年11月16日 週日 23時44分24秒 CST
  2025年11月16日 週日 23時46分13秒 CST
  2025年11月16日 週日 23時46分37秒 CST
  ---------------------------------
  Final result in $string: 2025年11月16日 週日 23時46分52秒 CST

 

=cut

print 'Which type output do you want to choose? 1. save as a file, 2. save as a variable. 3. both. [1/2/3]: ';
my $choose = <STDIN>;
goodbye() unless $choose == 1 or $choose == 2 or $choose == 3;

sub goodbye {
  print 'Please choose 1, 2, or 3.', $/;
  exit;
}

open my $output_file_fh, '>>', 'ch8-1_output.txt'
  or die 'Could not open ch8-1_output.txt';

my $read_fh = IO::File->new( 'ch8-1_output.txt', 'r' );

open my $scalar_fh, '>>', \ my $string;

sub output_to_fh {
  my( $fh, @data ) = @_;
  print $fh @data;
}

sub print_result_out_from_file {
  my $read_fh = shift;
  print "---------------------------------\n";
  print "Final result in ch8-1_output.txt:\n";
  while (<$read_fh>) {
    print $_;
  }
}

sub print_result_out_from_scalar {
  my $string = shift;
  print "---------------------------------\n";
  print "Final result in \$string: $string\n";
}

my $date_info = `date`;

if ($choose == 1) {
  output_to_fh($output_file_fh, $date_info);
  print_result_out_from_file($read_fh);
}
elsif ($choose == 2) {
  output_to_fh($scalar_fh, $date_info);
  print_result_out_from_scalar($string);
} 
else {
  foreach my $fh ( $output_file_fh, $scalar_fh ) {
    output_to_fh($fh, $date_info);
  }
  print_result_out_from_file($read_fh);
  print_result_out_from_scalar($string);
}

close $scalar_fh or die "Could not close file: $!";
close $read_fh or die "Could not close file: $!";
close $output_file_fh or die "Could not close file: $!";
