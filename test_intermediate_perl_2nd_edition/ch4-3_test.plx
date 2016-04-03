#!/usr/bin/perl
use strict;
use warnings;

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
	hat      => 'Black',
	shirt    => 'Blue',
	position => 'The Island',
);
my %mrs_howell_info = (
	name     => 'Mrs. Howell',
	hat      => 'Black',
	shirt    => 'Blue',
	position => 'The Island',
);
my @crew = (\%gilligan_info, \%skipper_info, \%mr_howell_info, \%mrs_howell_info);

my $format = "%-15s %-7s %-7s %-15s\n"; 
printf $format, qw(Name Shirt Hat Position); 

foreach my $crewmember (@crew) {
	printf $format, 
		$crewmember->{'name'}, 
		$crewmember->{'shirt'}, 
		$crewmember->{'hat'}, 
		$crewmember->{'position'};
}

change_position(\@crew);

foreach my $crewmember (@crew) {
	printf $format, 
		$crewmember->{'name'}, 
		$crewmember->{'shirt'}, 
		$crewmember->{'hat'}, 
		$crewmember->{'position'};
}

sub change_position {
	my $ref_crew = shift;
	for my $ref_person (@$ref_crew) {
		if($ref_person->{'name'} =~ /Howell/) {
			$ref_person->{'position'} = "The Island Country Club";
		}	
	}
}
