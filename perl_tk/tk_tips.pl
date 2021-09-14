package MyApplication;
use Modern::Perl;
use Tk;

sub new {
    my $class = shift;
    my $self  = {};
    $self->{root}   = shift;
    bless $self, $class;
    $self->initialisation();
    return $self;

}

sub initialisation {
    my $self = shift;
    my $lbl = $self->{root}->Label(-text => 'Hello, world!');
    my $btn = $self->{root}->Button(-text    => 'Quit', -command => sub { exit });
    $lbl->grid(-column => 0, -row => 0);
    $btn->grid(-column => 1, -row => 0);
}

my $root = MainWindow->new();
my $app = MyApplication->new($root);
MainLoop;

