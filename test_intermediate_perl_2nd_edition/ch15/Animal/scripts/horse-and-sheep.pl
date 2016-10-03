#!/usr/bin/perl -w
use strict;
use Horse;
use Sheep;

#my $tv_horse = Horse->named('Mr. Ed');
#$tv_horse->eat('hay');
#Sheep->eat('grass');

my $tv_horse = Horse->named('Mr. Ed');
#print $tv_horse->name, "'s default color is ", $tv_horse->color, "\n";
$tv_horse->set_color('black-and-white');
print $tv_horse->name, ' is colored ', $tv_horse->color, "\n";
