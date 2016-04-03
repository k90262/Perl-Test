#!/usr/bin/perl -w
use strict;
#use Storable qw(nstore retrieve freeze thaw dclone);
use Storable;
use JSON;

my $all = "**all machines**";
my $data_file = "ch6-2_total_bytes.data";
my $total_bytes;

my $json_text;

if( -e $data_file ) {
  local $/;
  open my $fh, '<:raw', $data_file;
  $json_text = <$fh>;
  $total_bytes = decode_json( $json_text );
}

while(<>) {
  next if /^#/;
  my($source, $destination, $bytes) = split;
  
  $total_bytes->{$source}{$destination} += $bytes;
  $total_bytes->{$source}{$all} 		+= $bytes;
}

{
  open my $fh, '>:utf8', $data_file;
  print $fh  to_json( $total_bytes, {pretty=>1} );
}
 
for my $s ( sort {$total_bytes->{$b}{$all} <=> $total_bytes->{$a}{$all}} keys %$total_bytes) {
  #print "$s " . $server_data{$s}{$all} . "\n";
  for my $d ( sort {$total_bytes->{$s}{$b} <=> $total_bytes->{$s}{$a}} keys %{$total_bytes->{$s}}) {
	next if $d eq $all;
	print $s, " => ", $d, ": ", $total_bytes->{$s}{$d}, "\n";
  }
}
#print "\n";
print to_json( $total_bytes, {pretty=>1} );
