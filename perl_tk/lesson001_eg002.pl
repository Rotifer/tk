use Tk;
use Modern::Perl;
my $mw = MainWindow->new();
my $lbl = $mw->Label(-text => 'Hello, world!')->pack(-expand => 'yes', -fill => 'both');
MainLoop();
