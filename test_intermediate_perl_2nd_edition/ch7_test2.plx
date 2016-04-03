#!/usr/bin/perl -w
# use strict;

# sub skipper_greets {
	# my $person = shift;
	# print "Skipper: Hey there, $person!\n";
# }

# sub gilligan_greets {
	# my $person = shift;
	# if ($person eq "Skipper") {
		# print "Gilligan: Sir, yes ,sir, $person!\n";
	# } else {
		# print "Gilligan: Hi, $person!\n";
	# }
# }

# sub professor_greets {
	# my $person = shift;
	# print "Professor: By my calculations, you must be $person!\n";
# }

# my %greets = (
	# Gilligan	=> \&gilligan_greets,
	# Skipper		=> \&skipper_greets,
	# Professor	=> \&professor_greets,
# );

# my @everyone = sort keys %greets;
# for my $greeter (@everyone) {
  # for my $greeted (@everyone) {
	# $greets{$greeter}->($greeted) unless $greeter eq $greeted;
  # }
# }

my %greets = (
	Gilligan	=> sub {
	  my $person = shift;
	  if ($person eq "Skipper") {
		  print "Gilligan: Sir, yes ,sir, $person!\n";
	  } else {
		  print "Gilligan: Hi, $person!\n";
	  }
	},
	Skipper		=> sub {
	  my $person = shift;
	  print "Skipper: Hey there, $person!\n";
	},
	Professor	=> sub {
	  my $person = shift;
	  print "Professor: By my calculations, you must be $person!\n";
	},
	
	Ginger		=> sub {
	  my $person = shift;
	  print "Ginger: (in a sultry voice) Well hello, $person!\n";
	},
);

my @room; # 開始時是空的
for my $person (qw(Gilligan Skipper Professor Ginger)) {
	print "\n";
	print "$person walks into the room.\n";
	for my $room_person (@room) {
		$greets{$person}->($room_person); # 打招呼
		$greets{$room_person}->($person); # 回招呼
	}
	push @room, $person; # 加入這個大家庭
}
<STDIN>
