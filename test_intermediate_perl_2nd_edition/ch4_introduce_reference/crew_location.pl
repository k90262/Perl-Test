#!/usr/bin/perl
use strict;
#use warnings;

my %gilligan_info = (
	name     => 'Gilligan', 
	hat      => 'White', 
	shirt    => 'Red', 
	position => 'First Mate',
);
my %skipper_info = (
	name     => 'Skipper',
	hat      => 'Black',
	shirt    => 'Blue',
	position => 'Captain',
);
my %mr_howell_info = (
	name     => 'Mr. Howell',
	hat      => undef,
	shirt    => 'White',
	position => 'Passenger',
);

my @crew = (\%gilligan_info, \%skipper_info, \%mr_howell_info);

my $format = "%-15s %-7s %-7s %-15s\n"; 
printf $format, qw(Name Shirt Hat Position); 

foreach my $crewmember (@crew) {
	printf $format, 
		$crewmember->{'name'}, 
		$crewmember->{'shirt'}, 
		$crewmember->{'hat'}, 
		$crewmember->{'position'};
}

print "----\n";

foreach my $person (@crew) {
  $person->{location} = 'The Island';
}

foreach my $person (@crew) {
  next unless $person->{name} =~ /Howell/;
  $person->{location} = 'The Island Country Club';
}

foreach my $person (@crew) {
  printf "$person->{name} at $person->{location}\n"; 
}
