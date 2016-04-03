#!/usr/bin/perl -w
use strict;

# use File::Find;
# sub what_to_do {
	# print "$File::Find::name found\n";
# }

# my @starting_directories = qw(.);

#find(\&what_to_do, @starting_directories);

# find(
  # sub {
    # print "$File::Find::name found\n";
  # },
  # @starting_directories,
# );

# my $total_size = 0;
# find(sub { $total_size += -s if -f }, '.');
# print $total_size, "\n";

# use File::Find;

# my $callback;
# {
  # my $count = 0;
  # $callback = sub { print ++$count, " : $File::Find::name\n" };
# }
# find($callback, '.');

# use File::Find;

# sub create_find_callback_that_counts {
  # my $count = 0;
  # return sub { print ++$count, ": $File::Find::name\n" };
# }

# my $callback = create_find_callback_that_counts();
# find($callback, '.');
# print "my updater:\n";
# find($callback, 'updater');
# print "my themes:\n";
# find($callback, 'themes');

# print "\n#################\n";

# my $callback1 = create_find_callback_that_counts( );
# my $callback2 = create_find_callback_that_counts( );
# print "my updater:\n";
# find($callback1, 'updater');
# print "my themes:\n";
# find($callback2, 'updater');

# use File::Find;

# sub create_find_callback_that_sums_the_size {
  # my $total_size = 0;
  # return sub {
    # if (@_) { # �ǤJ�����ѼơA�H�K�Ǧ^�ɮפj�p�`�M
	  # return $total_size;
	# } else {  # �Ӧ� File::Find: ���^�I�A�S���ѼƶǤJ
	  # $total_size += -s if -f;
	# }
  # };
# }

# my $callback = create_find_callback_that_sums_the_size( );
# find($callback, 'updater');
# my $total_size = $callback->('dummy');
# # dummy �i�H�O���N�r��A�@����]�ȡA���o�ɮפj�p�`�M
# print "total size of updater is $total_size\n";

# use File::Find;

# sub create_find_callbacks_that_sum_the_size {
  # my $total_size = 0;
  # return(sub { $total_size += -s if -f }, sub { return $total_size });
# }

# my ($count_em, $get_results) = create_find_callbacks_that_sum_the_size( );
# find($count_em, 'updater');
# my $total_size = &$get_results( );
# print "total size of updater is $total_size\n";

use File::Find;

sub create_find_callbacks_that_sum_the_size {
  my $total_size = 0;
  return(sub { $total_size += -s if -f }, sub { return $total_size });
}

##�]�w�Ʊ`��
my %subs;
foreach my $dir (qw(updater themes lib)) {
  my ($callback, $getter) = create_find_callbacks_that_sum_the_size( );
  $subs{$dir}{CALLBACK} = $callback;
  $subs{$dir}{GETTER} 	= $getter;
}

##�������
for (keys %subs) {
  find($subs{$_}{CALLBACK}, $_);
}

##�i�ܸ��
for (sort keys %subs) {
  my $sum = $subs{$_}{GETTER}->();
  print "$_ has $sum bytes\n";
}
<STDIN>