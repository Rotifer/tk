package TkApp;
use Tk;
use Modern::Perl;

sub new {
    my $class = shift;
    my $self  = {};
    $self->{mw} = MainWindow->new();
    $self->{mw}->title('Class Example');
    bless $self, $class;
    $self->setup();
    return $self;

}

sub setup {
    my $self = shift;
    my $lbl = $self->{mw}->Label(-text => 'Class');
    my $btn = $self->{mw}->Button(-text => 'Quit', -command => sub { exit });
    $lbl->grid(-column => 0, -row => 0);
    $btn->grid(-column => 1, -row => 0);
}

my $app = TkApp->new();
MainLoop();

