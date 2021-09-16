use Tk;
use Modern::Perl;
my $mw = MainWindow->new();
my $lbl = $mw->Label();
my $lbx = $mw->Listbox(-selectmode => "single");
$lbx->insert('end', keys %ENV);
my $btn = $mw->Button( -text => 'Show user',
                	-command => sub{
				        my $env_key = get_selected_opt($lbx);
		                        $lbl->configure(-text => $ENV{ $env_key })});
$lbx->pack();
$btn->pack();
$lbl->pack();
MainLoop();

sub get_selected_opt {
    my $lbx = shift;
    my $env_key;
    for my $opt ($lbx->curselection()) {
      $env_key = $lbx->get($opt);
    }
    return $env_key    
}
