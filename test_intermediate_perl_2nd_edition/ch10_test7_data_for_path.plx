#!/usr/bin/perl -w
use strict;

# use Data::Dumper;
# print Dumper(data_for_path('.'));

print dump_data_for_path(".", data_for_path('.'));
sub dump_data_for_path {
  my $path = shift;
  my $data = shift;
  
  if (not defined $data) {			# 純檔案
    print "$path\n";
	return;
  }
  
  foreach (sort keys %$data) {
    dump_data_for_path("$path\\$_", $data->{$_});
  }
}

sub data_for_path {
  my $path = shift;
  if (-f $path or -l $path) { 		# 檔案或是符號式連結
    return undef;
  }
  if (-d $path) {
    my %directory;
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH;
    closedir PATH;
    for my $name (@names) {
      next if $name eq '.' or $name eq '..';
      $directory{$name} = data_for_path("$path\\$name");
    }
    return \%directory;
  }
  warn "$path is neither a file nor a directory\n";
}
