my $app = sub {
    my $env = shift;
    if ( $env->{PATH_INFO} eq '/dance' ) {
        open my $fh, "<:raw", "./public_html/dance_pole.png"
          or die $!;
        return [ 200, [ 'Content-Type' => 'image/png' ], $fh ];
    }
    elsif ( $env->{PATH_INFO} eq '/' ) {
        return [ 200, [ 'Content-Type' => 'text/plain' ], ['Hello again'] ];
    }
    else {
        return [ 404, [ 'Content-Type' => 'text/html' ], ['404 Not Found'] ];
    }
};
