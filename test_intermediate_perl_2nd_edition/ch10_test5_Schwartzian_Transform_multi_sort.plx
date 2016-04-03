#!/usr/bin/perl -w
use strict;

my @input_data = qw(A T C G 我);

# my @output_data = 
#   map $_->[0],
#   sort {
#     $a->[1] cmp $b->[1] or
#     $a->[2] <=> $b->[2] or
#     $a->[3] cmp $b->[3] } 
#   map [ $_, lc, get_id($_), get_name($_) ], 
#   @input_data;

my @output_data = 
  map $_->{VALUE},
  sort {
    $a->{LOWER} cmp $b->{LOWER} or
    $a->{ID}    <=> $b->{ID}    or
    $a->{NAME}  cmp $b->{NAME} }
  map { 
    VALUE => $_,
    LOWER => lc,
    ID    => get_id($_),
    NAME  => get_name($_),
    }, 
  @input_data;
print "input data:  @input_data\n";
print "output data: @output_data\n";
sub get_id {

}

sub get_name {

}
