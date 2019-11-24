use Plack::App::File;

# plackup day5.file.psgi で起動した後に localhost:5000/hoge.html を表示させることができる
my $app = Plack::App::File->new(
#    root => "$ENV{HOME}/Documents/MyPerl/plack-test/public_html" ); # Mac
    root => "$ENV{HOMEDRIVE}/Users/jumpi/Documents/MyPerl/20191124_plack-handbook-test/public_html" ); # Windows

=pod
環境変数をドバドバッと全部表示する
$ perl -MData::Dumper -E "say Dumper %ENV;"
=cut
