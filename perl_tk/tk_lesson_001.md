# Tk introduction

## A first GUI

- Ensure that Tk is install and working correctly
- Dislay the obligatory "Hellow, world!"
- Introduces:
	- _Label_ widget
	- The main window
	- The _pack_ geometry manager
	= The _MainLoop_

__lesson001_eg001.__

```{perl}
use Tk;
use Modern::Perl;
my $mw = MainWindow->new();
my $lbl = $mw->Label(-text => 'Hello, world!')->pack();
MainLoop();
```

- Running the Perl code above produces the GUI below:

![Hello, world!](https://github.com/Rotifer/tk/blob/main/perl_tk/img/lesson001_eg001.png)

- Will look different on a different OS
- GUI can be re-sized 
- Script terminates when the GUI is closed
- Subsequent examples will build on the basic GUI

## The steps in building a Perl Tk GUI

- Import the Tk module
- Create a new _MainWindow_ instance
- Call methods that all begin with an uppercase letter on the _Mainwindow_ instance to create widgets
- Pass options to the widget creation call to set its properties ( __-text => 'Hello, world!'__)
- Use a geometry manager method call to make the visible (__pack()__), options can be passed to configure exactly how the widget is displayed
- Calls _MainLoop_ to bring up the window and start the Tk event loop
- Write and register a special type of Perl function known as callback handlers to respond to events such as mouse moves, widget clicks and keyboard actions


- This GUI is trivial but it demonstrates each of the steps outlined below. We can use greater range of widgets than the simple _Label_ and
use different geometry managers with a lot of different configurable options to create GUIs with rich functionality.

- The GUI is portable and should run on any OS with Perl and Tk installed and, though it will look slightly different on different systems, its functionality will
remain constant

- The Tk _MainLoop_ sets up an _event loop_ that recognises and responds to pre-defined mouse and keyboard actions performed by the user

## Configuring geometry _pack_ options


__lesson001_eg002.pl__

```{perl}
use Tk;
use Modern::Perl;
my $mw = MainWindow->new();
my $lbl = $mw->Label(-text => 'Hello, world!')->pack(-expand => 'yes', -fill => 'both');
MainLoop();
```

- Passing two options to the _pack_ method changes the GUI's behavious when the widget is re-sized
- "__When widgets are packed, we can specify whether a widget should expand to take up all available space, and if so, how it should stretch to fill that space. By default, widgets are not expanded when their parent is. But in this script, the names YES and BOTH (imported from the tkinter module) specify that the label should grow along with its parent, the main window.__" 
- Stretching the GUI produces the image shown below with the label text now centered. Try running the script and changing the options passed to _pack_ and observe how the
behaviour changes

![Image re-sizing](https://github.com/Rotifer/tk/blob/main/perl_tk/img/lesson001_eg002.png)

__"
For now, remember that the combination of expand=YES and fill=BOTH is perhaps the most common setting; it means “expand my space allocation to occupy all available space on my side, and stretch me to fill the expanded space in both directions.”__

We can later add or change options for any widget using the _configure_ method

## Buttons and actions

We can trigger an action by doing something such as clicking a button

__lesson001_eg003.l__

```{perl}
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
```

![Display _%ENV_ values](https://github.com/Rotifer/tk/blob/main/perl_tk/img/lesson001_eg003.png)


Here is a GUI that actually does something useful and demonstrates the central features of any GUI application:

- When launched it populates a listbox with the keys of Perl's builtin ___%ENV___ hash variable to display the names of a range of system settings
- The use can select a single value in the listbox
- When the button is clicked the value for the user's selection is displayed in a lisbox
- The button click action or _event_ in GUI parlance, gets the listbox selected value, passes the listbox instance as an argument to a named  subroutine that returns the value for the selected item
- The value displayed in the label is the result of a simle key lookup on the _%ENV_ hash
- Many years ago when Perl was popular for CGI web programming, display of the contents of _%ENV_ was a common exercise when getting started

### GUI summary

- Create a GUI using the widgets and geomtry managers - _pack_ here
- Widgets such as list boxes can be populated by passing Perl objects to options - $lbx->insert('end', keys %ENV);
- Event handlers can be attached to widgets as anonymous subroutines - 	-command => sub{ ....
- Event handlers can delegate to non-GUI subroutines -  my $env_key = get_selected_opt($lbx);
- Widget options can be configured dynamically by event handlers -  $lbl->configure(-text => $ENV{ $env_key })}

### Note on event handlers
The event handler concept is one of the trickiest to master in GUI development. In the example above, the handler is the anonymous
subroutine of the _-command_ option. That anonymous subroutine is an example of a __callback__ function. Note that it does not execute
when the GUI is loaded; it executes when the __event__, a button click in the given examle, occurs. 

In summary: 
- The event is some is something that happens such as a button is clicked by the user
- A handler is code that is executed in response to the event


__"For Button press callbacks, callback handlers always receive no arguments (other than an automatic self, for bound methods); any state information required by the callback handler must be provided in other ways—as global variables, class instance attributes, extra arguments provided by an indirection layer, and so on.
"__

__"Although tkinter invokes command callbacks with no arguments, such a lambda can be used to provide an indirect anonymous function that wraps the real handler call and passes along information that existed when the GUI was first constructed."__

### Note on application development

The GUI discussed here actually does something useful besides show-casing some general GUI techniques. That said, it wins no awards for style yet there
is a more important point: it is not written in a way that scales. Yes, the _get_selected_opt_ is standalone and potentially re-usable and that is a good thing.
But effective GUI programming is not like throwing together a quick-and-dirty script because there is inherent complexity in dealing with:

- GUI layout
- Callback code
- Attachment of events
- Setting and getting data values in the GUI

Once any script starts to grow in size, it benefits from:
- Planning and up-front design
- Separation of concerns
- Testing

This is especially true of GUIs. Making user-friendly GUIs that are rich in functionality, maintainable and extensible is not easy regardless of the library or
programming language used to implement them. If we added a few more widgets and actions to the example given above, it would quickly become unwieldy and difficult
to reason about. GUIs are one area of software development where object oriented language features shine in reducing repetitive code and making the applications
more robust and easier to reason about.

