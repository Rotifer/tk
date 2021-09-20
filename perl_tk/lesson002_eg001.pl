use Tk;
use Modern::Perl;

my $age_years;
my $name = '';
my $mw = MainWindow->new();
my $lbl_age = $mw->Label(-text => 'Enter your age in years:');
my $ent_age = $mw->Entry(-textvariable => \$age_years);
my $lbl_name = $mw->Label(-text => 'Enter your name:');
my $ent_name = $mw->Entry(-textvariable => \$name);
my $btn_store = $mw->Button(-text => 'Store Data', -command => \&store_data);
my $btn_exit = $mw->Button(-text => 'Exit', -command => sub { exit; });
my $lbl_feedback = $mw->Label(-text => '');
$lbl_age->grid(-row => 0, -column => 0);
$ent_age->grid(-row => 0, -column => 1);
$lbl_name->grid(-row => 1, -column => 0);
$ent_name->grid(-row => 1, -column => 1);
$btn_store->grid(-row => 2, -column => 0);
$btn_exit->grid(-row => 2, -column => 1);
$lbl_feedback->grid(-row => 3, -columnspan => 2);
MainLoop();

sub store_data {
    my $file_name = 'entries.txt';
    open(my $fh_out, '>>', 'entries.txt') || die "File problem: $!";
    say $fh_out "$age_years\t$name";
    $lbl_feedback->configure(-text => "Record for age '$age_years', name '$name' loaded");
    $age_years = '';
    $name = '';
    close $fh_out;
}
