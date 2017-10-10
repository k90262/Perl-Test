#!/usr/bin/perl -w
use strict;
use Horse;
use v5.10;

my $talking = Horse->new( name => "Mr. Ed" );
#$talking->color("grey"); # 設定顏色
#
#say $talking->name, ' is colored ', $talking->color;
$talking->speak;

