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
#$baab->color( 'black' );
#$baab->speak;

use Mouse;
my $mickey = Mouse->new( name => 'Mickey' );
$mickey->speak;

#test
my $no_name_mickey = Mouse->new();
print $mickey->name, "\n";
print Mouse->name, "\n";
print $no_name_mickey->name, "\n";


my $m = Mouse->new();
my $color = $m->color;
#$m->color('green'); # 程式中斷執行
$m->_private_set_color('green');
print "color before set: ", $color, "\n";
print "color after set: ", $m->color, "\n";
