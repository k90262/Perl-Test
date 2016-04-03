#!/usr/bin/perl -w
use strict;
# use Data::Dumper;
use File::Basename;

# print Dumper(data_for_path('.'));
dump_data_for_path('.', data_for_path('.'), "");

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
  my $indent = shift;

  if ( not defined $data) {
    # 純檔案
    print $indent, basename($path) , "\n";
    return;
  }

  my @keysArray = keys %$data;
  if(@keysArray == 0) {
    print $indent, basename($path), ", a empty directory\n";
  }
  else {
    print $indent, basename($path), ", with contents:\n";
    $indent = $indent .  "  ";
    foreach (sort @keysArray) {
      dump_data_for_path("$path/$_", $data->{$_}, $indent);
    }
  }
}
