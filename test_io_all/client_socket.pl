use IO::All;
use IO::All::LWP;

my $io = io('localhost:12345');
print while $_ = $io->getline;
