# Lesson 002 - Basic input and ouput

- One very common use of a GUI is to get user input and then store that input somewhere
- That "somewhere" is usually a database
- For the simple examples given here, I will just use a file
- I will cover writing to and reading from a database later
- I used the _pack_ geometry manager in earlier examples but this time I will use the _grid_
- I think _grid_ is easier especially when starting out
- Let's start with a very simple GUI that collects string and numeric input which it writes to a file

The GUI code shown here does the following:

- Has two inputs that are _Entry_ widgets paired with labels for age and name
- Two buttons: one to write the _Entry_ inputs to a file and one to close the GUI
- A single label that provides feedback when the input is written to the file

__lesson002_eg001.pl__

```{perl}
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
```

When the GUI code is run, the following should appear:

![Data entry GUI](https://github.com/Rotifer/tk/blob/main/perl_tk/img/lesson002_eg001.png)

### Code summary

- Import _Tk_ and _Modern::Perl__ libraries
- Create a _MainWindow_ instance
- Create two variables to hold the contents of the GUI _Entry_ widgets
- Create two _Label_/_Entry_ widget pairs by calling the _Label_ and _Entry_ methods of the _MainWindow_ instance
- Pass in options to set the displayed text of the labels and associate the _Entry_ contents with the two variables _$age_years_ 
and _$name_ by passing a __reference__ to each variable to the _textvariable_ option
- Create two buttons by calling the _Button_method of the _MainWindow_ instance
- Assign actions to the buttons assigning subrountine __references__ to their _-command_ options
- One button _-command_ option is passed an _anonymous_ subroutine wihle the second is passed a reference to a named subroutine (_\&store_data_)
- These subroutine references are the __event handlers__ for the button _click_ event
- The default event for a button in Tk is _click_ so we did not have to specify it here
- When the button labelled 'Store Data' is clicked, it event handler _store_data_ is invoked
- The _store_data_ subroutine can access the _Entry_ widget instance text values via the variable references associated with the _textvariable_ options
- The subroutine takes these two values and __appends__ (note '>>' argument in the _open_ command) them to a file called _entries.txt_
- When the 'Store Data' button is clicked, the _configure_ method of the third label is called with feedback on the action taken
- The two variables associated with the _Entry_ widget values are re-set to empty strings and the file is closed
- The GUI is then ready for another set of data entry or can be closed by clicking the 'Exit' button

