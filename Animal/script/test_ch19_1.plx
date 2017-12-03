#!/usr/bin/perl -w
use strict;
use Horse;
use v5.10;

my $talking = Horse->new( name => "Mr. Ed" );
#$talking->color("grey"); # 設定顏色
#
#say $talking->name, ' is colored ', $talking->color;
$talking->speak;

use Sheep;
my $baab = Sheep->new( color => 'white', name => 'Baab');
#my $baab = Sheep->new( name => 'Baab');
$baab->speak;

#$baab->color( 'Dolly' ); # 哎呀，這是個名稱！
$baab->color( 'black' );
$baab->speak;
