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
- To make the widgets visible, we need to call a geometry manager
- Here we use the _grid_ manager by calling each widget's _grid_ method passing in a row and column index
- The widgets appear on the GUI in the order in which their _grid_ methods were called
- Call the _MainLoop()_ method to display the GUI
- The default event for a button in Tk is _click_ so we did not have to specify it here
- When the button labelled 'Store Data' is clicked, it event handler _store_data_ is invoked
- The _store_data_ subroutine can access the _Entry_ widget instance text values via the variable references associated with the _textvariable_ options
- The subroutine takes these two values and __appends__ (note '>>' argument in the _open_ command) them to a file called _entries.txt_
- When the 'Store Data' button is clicked, the _configure_ method of the third label is called with feedback on the action taken
- The two variables associated with the _Entry_ widget values are re-set to empty strings and the file is closed
- The GUI is then ready for another set of data entry or can be closed by clicking the 'Exit' button

### The _grid_ geometry manager

- I find _grid_ to be easier than the alternative _pack_ geometry manager
- Most of the examples from now on will use _grid_
- There is a third alernative called _place_ which I do not discuss
- The _grid_ manager treats the available space as a set of cells where each cell is specified by zero-based row and column indices rather like a spreadsheet
- You can think of the grid it creates like a spreadsheet or an HTML table
- The _grid_ cells can be composed of one or more columns or rows by setting the _-rowspan_ or _-columnspan_ options
- The code example above sets the _-columnspan_ option for the _$lbl_feedback_ label to 2

### What this GUI shows

- The GUI we have produced here is basic and functional
- It exemplifies many of the major themes of general GUI development:
	1. Creating GUI widgets
	2. Using a geometry manager to lay the widgets out and display them on the GUI
	3. Attaching event handlers to widget events such as button clicks
	4. Getting user input and doing something with it
	5. Giving the user feedback

### GUI improvements

- We could add a GUI main window title
- Widget options could be set to make it look better
- A database would be a better storage location than a flat file
- there is no data validation: The _Entry_ for age implies a number but any text value can be entered here
- All of these improvements will be implemented in later lessons

### Coding style issues

- There are multiple problems with the code layout here
- For a small GUI such as this, it isn't such an issue but for larger more complex GUIs, it would be highly problematic
- I will show in later lessons how object oriented approaches can make GUI development easier and more scalable



