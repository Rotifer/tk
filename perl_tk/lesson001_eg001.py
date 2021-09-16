use Tk;                                                  # Import the Tk library
use Modern::Perl;                                        # Switch on strict, warnings and more recent Perl conveniences such as _say_
#from tkinter import label                               # get a widget object
Label(-text => 'Hello, world!')->pack();
MainLoop();

