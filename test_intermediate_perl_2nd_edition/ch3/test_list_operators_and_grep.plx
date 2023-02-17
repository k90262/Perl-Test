#!/usr/bin/perl -w
use strict;
use HTTP::SimpleLinkChecker qw(check_link);

# common list operator: print, sort, reverse

print 'Two castaways are ', 'Gilligan', ' and ', 'Skipper', "\n";

my @castaways = sort qw(Gilligan Skipper Ginger Professor Mary_Ann);
printf "%*s %s %s", 50, "sorted castaways: ", join(', ', @castaways), "\n";

@castaways = reverse  qw(Gilligan Skipper Ginger Professor Mary_Ann);
printf "%*s %s %s", 50,  "reversed castaways: ", join(', ', @castaways), "\n";

@castaways = qw(Gilligan Skipper Ginger Professor);
push @castaways, 'Mary_Ann';
@castaways = reverse @castaways;
printf "%*s %s %s", 50,  "reversed (and replaced) castaways: ", join(', ', @castaways), "\n";

print "\n";
# check value > 10 in a array

my @input_numbers = (1, 2, 4, 8, 16, 32, 64);
my @bigger_than_10 = grep $_ > 10, @input_numbers;
print " input_numbers: ", join(", ", @input_numbers), "\n";
print "bigger_than_10: ", join(", ", @bigger_than_10), "\n";

my @end_in_4 = grep /4$/, @input_numbers;
print "      end_in_4: ", join(", ", @end_in_4), "\n";

my @odd_digit_sum = grep digit_sum_is_odd($_), @input_numbers;
print " odd_digit_sum: ", join(", ", @odd_digit_sum), "\n";

sub digit_sum_is_odd {
  my $input = shift;
  my @digits = split //, $input; # suppose that there are no non-number characters in this string.
  my $sum;
  $sum += $_ for @digits;
  return $sum % 2;
}

#OR

my @odd_digit_sum2 = grep {
  my $sum;
  $sum += $_ for split //;
  $sum % 2;
} @input_numbers;
print "odd_digit_sum2: ", join(", ", @odd_digit_sum2), "\n";
print "---\n";

my @links = qw(google.com testtesttest);
my @good_links = grep {
  my $code = check_link( $_ );
  #print "check_link code: $code\n";
  unless (defined $code) {
    print "Error: $HTTP::SimpleLinkChecker::ERROR?\n";
  }
  defined $code;
} @links;
print "     links: ", join(", ", @links), "\n";
print "good_links: ", join(", ", @good_links), "\n";
