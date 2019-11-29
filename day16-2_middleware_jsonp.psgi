use JSON;

my $app = sub {
    my $env = shift;
    if ( $env->{PATH_INFO} eq '/whatever.json' ) {
        my $body = JSON::encode_json( { hello => 'plack' } );
        return [ 200, [ 'Content-Type', 'application/json' ], [$body] ];
    }

    return [ 404, [ 'Content-Type', 'text/html' ], ['Not Found'] ];
};

use Plack::Builder;
builder {
    enable "JSONP";
    $app;
};
