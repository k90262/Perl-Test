#!/usr/bin/perl -w
use strict;

my $header_width = length "double_output_result: ";

sub b_say {
  my ($item, @result) = @_;
  printf "%*s %s\n", $header_width, "$item", join(", ", @result);
}

my @input_numbers = (1, 2, 4, 8, 16, 32, 64);
my @result = map $_ + 100, @input_numbers;
b_say("input_numbers: ", @input_numbers);
b_say("result: "       , @result);

my @double_output_result = map { $_, 3 * $_} @input_numbers;
b_say("double_output_result: ", @double_output_result);

print ("\n--array cover to hash--\n");
my %hash = @double_output_result;
my %hash2 = map { $_, 3 * $_} @input_numbers; # data %hash eq data %has2

my @hash_key = sort { $a - $b } keys %hash;
my @hash_value = map { $hash2{$_} } @hash_key;
b_say("hash key: ", @hash_key);
b_say("hash value: ", @hash_value);


my @castaways = qw(Bill Gilligan Cow);

# using hash created by map() to check if user is in the orignal array.
{
  my %hash = map { $_, 1 } @castaways;
  my $person = 'Gilligan';
  my $person2 = 'Goofy';
  
  if ( $hash{$person} ) {
    print "$person is a castaway. \n";
  }
  
  unless ( $hash{$person2} ) {
    print "$person2 is NOT a castaway. \n";
  }
}


print ("\n--oterh map testing--\n");
sub map_split_number
{
  my @result = map { split // } @input_numbers;
  b_say("map_split_number: ", @result);
}
map_split_number();

sub map_split_number_which_ending_num_4 {
  my @result = map {
    my @digits = split //, $_;
    if ($digits[-1] == 4) {
      @digits;
    }
    else {
      ( );
    }
  } @input_numbers;
  b_say("map_split_number_which_ending_num_4: ", @result);
}
map_split_number_which_ending_num_4();
