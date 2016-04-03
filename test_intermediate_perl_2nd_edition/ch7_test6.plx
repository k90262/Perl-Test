#!/usr/bin/perl -w
use strict;

use v5.16;

# package MagicalCodeRef 1.00 {
  # use overload '""' => sub {
    # require B;
	
	# my $ref = shift;
	# my $gv = B::svref_2object($ref)->GV;
	
	# require B::Deparse;
	# my $deparse = B::Deparse->new;
	# my $code = $deparse->coderef2text($ref);
	
	# my $string = sprintf "---code ref---\n%s:%d\n%s\n---",
	  # $gv->FILE, $gv->LINE, $code;
  # };
  
  # sub enchant { bless $_[1], $_[0] }
# }

# my $sub = MagicalCodeRef->enchant( sub { say 'Gilligan!!'} );

# package MagicalCodeRef 1.01 {
  # use overload '""' => sub {
    # require B;
	
	# my $ref = shift;
	# my $gv = B::svref_2object($ref)->GV;
	
	# require B::Deparse;
	# my $deparse = B::Deparse->new;
	# my $code = $deparse->coderef2text($ref);
	
	# require PadWalker;
	# my $hash = PadWalker::closed_over( $ref );
	
	# require Data::Dumper;
	# local $Data::Dumper::Terse = 1;
	# my $string = sprintf "---code ref---\n%s:%d\n%s\n---\n%s---",
	  # $gv->FILE, $gv->LINE,
	  # $code,
	  # Data::Dumper::Dumper( $hash );
  # };
  
  # sub enchant { bless $_[1], $_[0] }
# }

# my $sub = do {
  # my $name = 'Gilligan'; 
  # MagicalCodeRef->enchant( sub { say "$name!!"} )
 # };
 
# my @array = ( \ 'xyz', [qw(a b c)], $sub );

# foreach ( @array ) {
  # when( ref eq ref \ ''	) 			{ say "Scalar $$_" }
  # when( ref eq ref []	)			{ say "Array @$_" }
  # when( ref eq 'MagicalCodeRef' )	{ say "Sub $sub" }
# }

# use Data::Dump::Streamer;

# Dump $sub;

use Data::Dump::Streamer;

my @luxuries = qw(Diamonds Furs Caviar);

my $hash = {
  Gilligan		=> sub { say 'Howdy Skipper!'		},
  Skipper		=> sub { say 'Gilligan!!'			},
  'Mr. Hoowell' => sub { say 'Noney money money!'	},
  Ginger		=> sub { say $luxuries[rand @luxuries] },
};

Dump $hash;

<STDIN>