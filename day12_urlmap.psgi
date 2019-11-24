my $app1 = sub {
    return [200,[],["Hello, Kamioka"]];
};

my $app2 = sub {
    return [200,[],["Hello, Nobuhiro"]];
};

use Plack::App::URLMap;
my $app = Plack::App::URLMap->new;
$app->mount("/k" => $app1);
$app->mount("/n" => $app2);
$app = $app->to_app;
