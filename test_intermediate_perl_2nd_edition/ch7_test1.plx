#!/usr/bin/perl -w
use strict;

sub skipper_greets {
	my $person = shift;
	print "Skipper: Hey there, $person!\n";
}

sub gilligan_greets {
	my $person = shift;
	if ($person eq "Skipper") {
		print "Gilligan: Sir, yes ,sir, $person!\n";
	} else {
		print "Gilligan: Hi, $person!\n";
	}
}

skipper_greets("Gilligan");
gilligan_greets("Skipper");

print "\n";

skipper_greets("Professor");
gilligan_greets("Professor");

sub professor_greets {
	my $person = shift;
	print "Professor: By my calculations, you must be $person!\n";
}

professor_greets('Gilligan');
professor_greets('Skipper');

print "\n";

my $ref_to_greeter = \&skipper_greets;
& skipper_greets ( 'Gilligan' );
& { $ref_to_greeter } ( 'Gilligan' );
& $ref_to_greeter ( 'Gilligan' ); ## 若大括號內的值是簡單純量，可省略括號
$ref_to_greeter -> ( 'Gilligan' );

print "\n";

for my $greet (\&skipper_greets, \&gilligan_greets) {
	$greet->('Professor');
}

###
print "\n";

my %greets = (
	Gilligan	=> \&gilligan_greets,
	Skipper		=> \&skipper_greets,
	Professor	=> \&professor_greets,
);

for my $person (qw(Skipper Gilligan)) {
	$greets{$person}->('Professor');
}
<STDIN>