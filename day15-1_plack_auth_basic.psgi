use Plack::Builder;

my $app = sub {
    my $env = shift;
    if ( $env->{REMOTE_USER} ) {

        # Authenticated
        [ 200, [ 'Content-Type', 'text/plain' ], ["Authenticated: " . $env->{REMOTE_USER}] ];
    }
    else {
        # Unauthenticated
        [ 200, [ 'Content-Type', 'text/plain' ], ["Unauthenticated"] ];
    }
};

builder {
    mount "/private" => builder {
        enable "Auth::Basic", authenticator => sub {
            my ( $username, $password ) = @_;
            return $username eq 'admin' && $password eq 'foobar';
        };
        $app;
    };
    mount "/public" => $app;
};
