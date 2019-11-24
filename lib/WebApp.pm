package WebApp;
use base 'CGI::Application';
 
# ( setup() can even be skipped for common cases. See docs below. )
sub setup {
      my $self = shift;
      $self->start_mode('mode1');
      $self->mode_param('rm');
      $self->run_modes(
              'mode1' => 'do_stuff',
              'mode2' => 'do_more_stuff',
              'mode3' => 'do_something_else'
      );
}
sub do_stuff {
    my $self = shift;
 
     # Get CGI query object
     my $q = $self->query();
 
     my $output = '';
     $output .= $q->start_html(-title => 'Widget Search Form');
     $output .= $q->start_form();
     $output .= $q->textfield(-name => 'widgetcode');
     $output .= $q->hidden(-name => 'rm', -value => 'mode2');
     $output .= $q->submit();
     $output .= $q->end_form();
     $output .= $q->end_html();
 
     return $output;
}
sub do_more_stuff { ... }
sub do_something_else { ... }
1;
