package RegexTester;
use Tk;
use Tk::FileSelect;
use Modern::Perl;

sub new {
    my $class = shift;
    my $self = {};
    $self->{MW} = MainWindow->new(-width => 800, -height => 600, -title => 'Regular Expression Tester');
    bless $self, $class;
    $self->setup_gui();
    return $self;
}

# Creates the GUI layout and adds the widgets
sub setup_gui{
    my $self = shift;
    my $lbl_regex =  $self->{MW}->Label(-text => 'Regular Expression');
    $lbl_regex->grid(-row => 0, -column => 0, -sticky => 'w');
    $self->{txt_regex} = $self->{MW}->Text(-height => 3, -background => 'white'); 
    $self->{txt_regex}->grid(-row => 1, -columnspan => 4);
    $self->{btn_open_regex} =  $self->{MW}->Button(-text => 'Open Regex', -command => sub {$self->open_regex_file()});
    $self->{btn_open_regex}->grid(-row => 2, -column => 0); 
    $self->{btn_save_regex} =  $self->{MW}->Button(-text => 'Save Regex');
    $self->{btn_save_regex}->grid(-row => 2, -column => 1); 
    my $lbl_text_to_match_on =  $self->{MW}->Label(-text => 'Text to Match On');
    $lbl_text_to_match_on->grid(-row => 3, -column => 0);
    $self->{txt_text_to_match_on} = $self->{MW}->Text(-height => 6, -background => 'white');
    $self->{txt_text_to_match_on}->grid(-row => 4, -columnspan => 4);
    my $lbl_replacement_text =  $self->{MW}->Label(-text => 'Replacement Text');
    $lbl_replacement_text->grid(-row => 5, -column => 0);
    $self->{txt_replacement_text} = $self->{MW}->Text(-height => 3, -background => 'white');
    $self->{txt_replacement_text}->grid(-row => 6, -columnspan => 4);
    my $lbl_results_of_match =  $self->{MW}->Label(-text => 'Results of Match');
    $lbl_results_of_match->grid(-row => 7, -column => 0);
    $self->{txt_results_of_match} = $self->{MW}->Text(-height => 6, -background => 'white');
    $self->{txt_results_of_match}->grid(-row => 8, -columnspan => 4);    
    $self->{btn_is_match} =  $self->{MW}->Button(-text => 'IsMatch()');
    $self->{btn_is_match}->grid(-row => 9, -column => 0); 
    $self->{btn_replace} =  $self->{MW}->Button(-text => 'Replace()');
    $self->{btn_replace}->grid(-row => 9, -column => 1);
    $self->{btn_split} =  $self->{MW}->Button(-text => 'Split()');
    $self->{btn_split}->grid(-row => 9, -column => 2);
    $self->{btn_matches} =  $self->{MW}->Button(-text => 'Matches()');
    $self->{btn_matches}->grid(-row => 9, -column => 3);     
}

# http://www.java2s.com/Code/Perl/GUI/GetselectedFilefromFileDialog.htm
sub open_regex_file {
    my $self = shift;
    my $file_dialog = $self->{MW}->FileSelect(-directory => '.');
    my $file_name = $file_dialog->Show();
    if ($file_name ne '' ) {
        open (my $fh, '<', $file_name);
        $self->{txt_regex}->delete('1.0', 'end');
        while (my $line = <$fh>) {
             $self->{txt_regex}->insert("end", $line);
        }
        close($fh);
    }	
}
my $regex_tester = RegexTester->new();
MainLoop();

