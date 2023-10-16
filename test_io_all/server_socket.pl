use IO::All;

my $socket = io(':12345')->fork->accept;
$socket->print($_) while <DATA>;
$socket->close;

__DATA__
On your mark,
Get set,
Go!
