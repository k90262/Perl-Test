use IO::All;
use IO::All::LWP;

#my $io = io('localhost:12345');
#my $io = IO::All->new('http://localhost:8080/server_socket.pl');
#my $io = IO::All->new('http://localhost:8080/client_socket.pl');
my $io = IO::All->new('http://localhost:8080/client_socket.pl');
print while $_ = $io->getline;

# as same as:
# my $http < io->http('http://localhost:8080/client_socket.pl');
# print $http;
