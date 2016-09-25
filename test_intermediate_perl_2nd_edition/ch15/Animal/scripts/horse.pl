#!perl
# script/horse.pl
use Horse;
my $name = 'Mr. Ed';
my $tv_horse = \$name;

bless $tv_horse, 'Horse';

my $noise = $tv_horse->sound;
#print $noise, "\n";
print $tv_horse->name, " says ", $tv_horse->sound, "\n";
