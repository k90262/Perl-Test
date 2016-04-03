#!/usr/bin/perl -w
use strict;
use Data::Dumper;
use Benchmark;

chdir; # 預設是大家的家目錄

#my $t0 = Benchmark->new;
#my @sorted1 = sort { -s $a <=> -s $b } glob '*';

#my $t1 = Benchmark->new;
# my @sorted2 = 
#   map $_->[0],
#   sort { $a->[1] <=> $b->[1] } 
#   map [ $_, -s $_ ], 
#   glob '*';

#my $t2 = Benchmark->new;

#my $td1 = timediff($t0, $t1);
#my $td2 = timediff($t1, $t2);

#print Dumper( @sorted );
#print "default     - the code took: ", timestr($td1), "\n"; 
#print "Schwartzian - the code took: ", timestr($td2), "\n"; 

timethese(-10, {
  'default' => sub { sort { -s $a <=> -s $b } glob '*'; },
  'Schwartzian' => sub {
    map $_->[0],
    sort { $a->[1] <=> $b->[1] }
    map [ $_, -s $_ ],
    glob '*';
    }
});
