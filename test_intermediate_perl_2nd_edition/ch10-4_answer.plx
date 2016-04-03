#!/usr/bin/perl -w
use strict;
# use Data::Dumper;
use File::Basename;

# print Dumper(data_for_path('.'));
dump_data_for_path('.', data_for_path('.'));

sub data_for_path {
  my $path = shift @_;

  if ( -l $path or -f $path ) {
    return undef;
  }

  if ( -d $path ){
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @files = readdir PATH;
    close PATH;
    my %directory;
    for my $file (@files) {
      next if $file eq '.' or $file eq '..';
      $directory{$file} = data_for_path("$path/$file");
    }
    return \%directory;
  }

  warn "$path is neither a file nor a directory\n";
  return undef;
}

sub dump_data_for_path {
  my $path = shift;
  my $data = shift;
  my $level = shift || 0;

  print '  ' x $level, $path;

  if ( not defined $data) {
    print "\n";
    return;
  }

  if (keys %$data) {
    print ", with contents of:\n";
    foreach (sort keys %$data) {
      dump_data_for_path("$path/$_", $data->{$_}, $level + 1);
    }
  } else {
    print ", an empty directory\n";
  }
}
