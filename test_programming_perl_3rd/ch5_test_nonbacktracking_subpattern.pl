#! /user/bin/perl -00p
#use re "debug";
=pod

=head1 test nonbacktracking subpattern

=head2 example

  $ cat test_heredoc.tx
  test.sh 1.sh 2.sh 3.sh 4.sh 5.sh 6.sh \
  q.sh i.sh j.sh .k.sh
  
  $  cat test_heredoc.tx | perl ch5_test_nonbacktracking_subpattern.pl
  GOT 1: test.sh 1.sh 2.sh 3.sh 4.sh 5.sh 6.sh \
  q.sh i.sh j.sh .k.sh
  
  test.sh 1.sh 2.sh 3.sh 4.sh 5.sh 6.sh \
  q.sh i.sh j.sh .k.sh

=cut

while ( /( (?>.+) ( (?<=\\) \n .*  )+ ) /gx ) {
  print "GOT $.: $1\n\n";
}
