use Plack::Test;
use Test::More;
use HTTP::Request::Common;

my $app = sub {
    return [ 200, [ 'Content-Type', 'text/plain' ], ["Hello"] ];
};

test_psgi
  app    => $app,
  client => sub {
    my $cb  = shift;
    my $req = HTTP::Request->new( GET => '/' );
    my $res = $cb->($req);
    is $res->code,    200;
    is $res->content, "Hello";
  };

done_testing;
