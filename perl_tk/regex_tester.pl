package RegexTester;
use Tk;
use Modern::Perl;

sub new {
    my $class = shift;
    my $self = {};
    $self->{MW} = MainWindow->new(-width => 800, -height => 600, -title => 'Regular Expression Tester');
    #$self->{mw}->geometry(-width => 800, -height => 600);
    bless $self, $class;
    $self->setup_regex_input();
    return $self;
}

sub setup_regex_input {
    my $self = shift;
    my $frm_regex = $self->{MW}->Frame();
    $frm_regex->grid(-row => 0, -column => 0);
    my $lbl_regex =  $frm_regex->Label(-text => 'Regular Expression');
    $lbl_regex->grid(-row => 0, -column => 0, -sticky => 'w');
    my $txt_regex =  $frm_regex->Text(-height => 3);
    $txt_regex->grid(-row =>1, -column => 0)
}

sub setup_regex_options {
    my $self = shift;

}

my $regex_tester = RegexTester->new();
MainLoop();

