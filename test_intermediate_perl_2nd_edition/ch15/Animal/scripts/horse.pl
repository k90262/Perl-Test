#!perl
# script/horse.pl
use Horse;
# my $name = 'Mr. Ed';
# my $tv_horse = \$name;
# 
# bless $tv_horse, 'Horse';
my $tv_horse = Horse->named('Mr. Ed');

#my $noise = $tv_horse->sound;
#print $noise, "\n";
#print $tv_horse->name, " says ", $tv_horse->sound, "\n";
Horse->speak;
$tv_horse->speak;

print Horse->name, "\n";
print $tv_horse->name, "\n";
