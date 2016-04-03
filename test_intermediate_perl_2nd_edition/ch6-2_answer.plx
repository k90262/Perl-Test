#!/usr/bin/perl -w
use strict;
#use Storable qw(nstore retrieve freeze thaw dclone);
use JSON;

my $all = "**all machines**";
my $data_file = "total_bytes.json";

my $total_bytes; # 需要存入參照
if( -e $data_file ) {
	local $/;
	open my $fh, '<:raw', $data_file;
	my $json_text = <$fh>;
	$total_bytes = decode_json( $json_text );
}

while(<>) {
  next if /^#/;
  my($source, $destination, $bytes) = split;
  
  $total_bytes->{$source}{$destination} += $bytes;
  $total_bytes->{$source}{$all} 	+= $bytes;
}

{
	open my $fh, '>:utf8', $data_file;
	print $fh to_json( $total_bytes, { pretty => 1 } );
}

for my $source ( sort keys %$total_bytes) {
  print "$source\n";
  my $dest_hash = $total_bytes->{$source};
  for my $dest ( sort keys %$dest_hash) {
	print "  $dest $dest_hash->{$dest}\n";
  }
}
#print "\n";
