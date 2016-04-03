#!/usr/bin/perl -w
use strict;
#####################################
# ch11_test2.plx
#
# Syntax: 
#   perl ch11_test2.plx [CURRENT_HEADING:number] [WISH_HEADING:numer]
# Example: 
#   perl ch11_test2.plx 10 20
#####################################

# sub load_common_subroutines {
  # open my $more_fh, '<', 'Navigation.pm' or die "Navigation.pm: $!";
  # undef $/; # 啟用slurp模式，讀取整個檔案（否則一次只讀入一列）
  # my $more_code = <$more_fh>;
  # close $more_fh;
  # eval $more_code;
  # die $@ if $@;
# }

# load_common_subroutines();

# do'DropAnchor.pm';
# die $@ if $@;
# do 'Navigation.pm';
# die $@ if $@;

require 'DropAnchor.pm';
require 'Navigation.pm';

my $wish_heading = ($ARGV[1]) ? $ARGV[1] : 0;
turn_toward_heading($wish_heading);

drop_anchor() if at_dock();
