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


- This GUI is trivial but it demonstrates each of the steps outlined below. We can use greater range of widgets than the simple _Label_ and
use different geometry managers with a lot of different configurable options to create GUIs with rich functionality.

- The GUI is portable and should run on any OS with Perl and Tk installed and, though it will look slightly different on different systems, its functionality will
remain constant

- The Tk _MainLoop_ sets up an _event loop_ that recognises and responds to pre-defined mouse and keyboard actions performed by the user




