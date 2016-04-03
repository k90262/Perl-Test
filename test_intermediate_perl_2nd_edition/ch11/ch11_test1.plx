#!/usr/bin/perl -w
#####################################
# ch11_test1.plx
#
# Syntax: 
#   perl ch11_test1.plx [CURRENT_HEADING:number] [WISH_HEADING:numer]
# Example: 
#   perl ch11_test1.plx 10 20
#####################################

sub turn_toward_heading {
  my $new_heading = shift;
  my $current_heading = current_heading();
  print "Current heading is ", $current_heading, ".\n";
  my $direction = 'right';
  my $turn = ($new_heading - $current_heading) % 360;
  unless ($turn) {
    print "On course (good job!).\n";
    return;
  }
  print "Come about to $new_heading ";
  if ($turn > 180) { # 轉彎幅度大於180度
    $turn = 360 - $turn;
    $direction = 'left';
  }
  print "by turning $direction $turn degrees. \n";
}

sub current_heading {
  return (($ARGV[0]) ? $ARGV[0] : 0);
}

my $wish_heading = ($ARGV[1]) ? $ARGV[1] : 0;
turn_toward_heading($wish_heading);
