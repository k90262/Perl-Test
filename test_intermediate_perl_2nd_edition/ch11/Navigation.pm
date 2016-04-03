use v5.12;

package Navigation {
our @homeport = (21.283, -157.842); # 變數的套件版本

{
  package main;
  
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
}

sub get_me_home {
  my @homeport = (25.0890417,121.2062243);

  # .. @homeport .. # 提及的是語彙變數
  print "get_me_home: @homeport\n";
  # .. @Navigation::homeport .. # 提及的是套件變數
  print "Navigation var: @Navigation::homeport\n";
  return @homeport;
}

sub turn_toward_port {
  turn_toward_heading(0-45);
}

# .. @homeport .. # 提及的是套件變數
}
1;
