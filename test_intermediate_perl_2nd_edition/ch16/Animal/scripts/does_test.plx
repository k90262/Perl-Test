#!/usr/bin/perl -w
use strict;

use v5.10;
use Horse;

if (Horse->DOES('Animal')) {
  print "A Horse is an Animal.\n";
}

my $tv_horse = Horse->named("Mr. Ed");
#if ($tv_horse->DOES('Animal')) {	# 是Animal的一員嗎？ (It will show error if $tv_horse were an unbless reference)
#if (UNIVERSAL::DOES($tv_horse,'Animal')) {	# 是Animal的一員嗎？ (Un-follow the OO principle)
if (eval {$tv_horse->DOES('Animal') }) {	# 是Animal的一員嗎？
  print $tv_horse->name, "is an Animal.\n";
  if ($tv_horse->DOES("Horse")) {	# 是Horse的一員嗎？
    print 'In fact, ', $tv_horse->name, " is a Horse.\n";
  } else {
    print "...but it's not a Horse.\n";
  }
}

#
# define a UNIVERSAL method
#

sub UNIVERSAL::fandango {
  warn 'object ', shift, " can do the fandango!";
}

$tv_horse->fandango;

#
# UNIVERSAL::DOES vs ref($some_object) eq 'SomeClass'
#

my @all_animals = qw(Animal Horse Sheep WWW);
push @all_animals, $tv_horse;
print '@all_animals = ', "@all_animals\n";

my @horses = grep $_->DOES('Horse'), @all_animals;
print '@horse = ', "@horses\n";

my @horses_only = grep ref $_ eq 'Horse', @all_animals;
print '@horse_only = ', "@horses_only\n";

#
# UNIVERSAL::can
#

#$tv_horse = {};

if (eval { $tv_horse->can('eat') }) {
  $tv_horse->eat('hay');
}

if (eval { $tv_horse->can('fandango') }) {
  $tv_horse->fandango;
}

#
# AUTOLOAD
#

$tv_horse->eat('hay');

$tv_horse->set_height('180');
print 'After set_height to 180, $tv_horse\'s height is ', $tv_horse->height(), "\n";
