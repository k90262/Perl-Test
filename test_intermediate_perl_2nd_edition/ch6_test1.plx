#!/usr/bin/perl -w
use strict;
#use Data::Printer;
#use Data::Dumper;
#use Storable qw(nstore retrieve freeze thaw dclone);
# use YAML;
use JSON;

# my @data1 = qw(one won);
# my @data2 = qw(two too to);
# push @data2, \@data1;
# push @data1, \@data2;

# open( my $filename, ">", "store.txt" ) 
	# or die "cannot open > store.txt";

#my $filename = "store.txt";
#my $array_ref = [\@data1, \@data2];
#nstore $array_ref, $filename;
#my $data_structure = retrieve $filename;

#my @packed = @{ dclone \@data1 };
#push @{ $data1[2] }, 'blue_shirt';
 # my $string = Dumper(\@data1, \@data2);
#my $string = Dumper(\@data1);
#my $string = Data::Dumper->Dump(
	# [ \@data1, \@data2 ],
	# [ qw(*data1 *data2) ]
	# );
#print $string;

# my $frozen = freeze [\@data1, \@data2];
# my $data_structure = thaw( $frozen );
# my $data_structure = eval $string;
#print Dumper($data_structure);
#print Dumper(\@data1);
# print Dump(\@data1);
#print Dumper(\@packed);
# print "$data_structure";
# package Foo;
    # sub new {bless {'a' => 1, 'b' => sub { return "foo" }}, $_[0]};
    # package Fuz;                       # a weird REF-REF-SCALAR object
    # sub new {bless \($_ = \ 'fu\'z'), $_[0]};
    # package main;
    # $foo = Foo->new;
    # $fuz = Fuz->new;
    # $boo = [ 1, [], "abcd", \*foo,
             # {1 => 'a', 023 => 'b', 0x45 => 'c'},
             # \\"p\q\'r", $foo, $fuz];
    # ########
    # # simple usage
    # ########
    # $bar = eval(Dumper($boo));
    # print($@) if $@;
    # print Dumper($boo), Dumper($bar);  # pretty print (no array indices)

my %total_bytes;
while (<>) {
 my ($source, $destination, $bytes) = split;
 $total_bytes{$source}{$destination} += $bytes;
}

foreach my $source ( sort keys %total_bytes ) {
 # print "$source\n";
 my $dest_hash = $total_bytes{$source};
 foreach my $dest ( sort keys %$dest_hash ) {
   # print " $dest $dest_hash->{$dest}\n";
 }
}

print to_json( \%total_bytes, { pretty => 1} );
#print p( %total_bytes );
