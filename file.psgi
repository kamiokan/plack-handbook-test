use Plack::App::File;

my $app = Plack::App::File->new(root => "$ENV{HOME}/Documents/MyPerl/plack-test/public_html");
