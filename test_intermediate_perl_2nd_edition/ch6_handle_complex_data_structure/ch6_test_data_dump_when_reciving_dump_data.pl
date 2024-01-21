#!/usr/bin/perl -w
#use strict;

=pod

=head1 bytecounts (recive dat from Data::Dumper)

=head2 Usage Example

  $ perl ch6_test_data_dump_when_reciving_dump_data.pl
  one%

=cut

my $VAR1;
my $s = <<'HEREDOC';
$VAR1 = [
          'one',
          'won',
          [
            'two',
            'too',
            'to',
            []
          ]
        ];
$VAR1->[2][3] = $VAR1;
$VAR2 = $VAR1->[2];
HEREDOC

#print $s, "\n";
my $data_structure = eval $s;
print $VAR1->[0];

