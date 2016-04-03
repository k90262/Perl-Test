#!/usr/bin/perl -w
use strict;
use Data::Dumper;

my @skipper 	= qw(blue_shirt hat jackedt preserver sunscreen);
my @professor	= qw(sunscreen water_bottle slide_rule batteries radio);
my @gilligan	= qw(red_shirt hat lucky_socks water_bottle);

my %all = (
	Gilligan 	=> \@gilligan,
	Skipper	 	=> \@skipper,
	Proffessor 	=> \@professor,
);

# my @all_wet = grep {
	# my @items = @{ $all{$_} };
	# grep $_ eq 'water_bottle', @items;
# } keys %all;
# print Dumper(\@all_wet);

# my @remapped_list = map {
	# [ $_ => $all{$_} ]
# } keys %all;
# print Dumper(\@remapped_list);

my @person_item_pairs = map {
	my $person = $_;
	my @items = @{ $all{$_} };
	map [ $person => $_ ], @items;
} keys %all;
print Dumper(\@person_item_pairs);