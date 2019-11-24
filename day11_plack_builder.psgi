my $app = sub {
    return [200,[],["Hello, World"]];
};

use Plack::Builder;
builder {
    enable "JSONP";
    enable "Auth::Basic", authenticator => \&authen_cb;
    enable "Deflater";
    $app;
};

sub authen_cb {
    my($username, $password, $env) = @_;
    return $username eq 'admin' && $password eq 's3cr3t';
}
