#!/usr/bin/perl -w
use strict;
# perl FindDB1.plx ch01_test.txt
$/ = ".\n";
while (<>) {
  next unless s/\b([a-z]+)((?:\s|<[^>]+>)+)(\1\b)/\e[7m$1\e[m$2\e[7m$3\e[m/ig;
  s/^(?:[^\e]*\n)+//mg; # 移除沒標記的行
  s/^/$ARGV: /mg;	# 確保每一行都以檔名開頭
  print;
}

