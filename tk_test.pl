#!/usr/bin/env perl
use Modern::Perl; 
use Tk;
 
my $mw = MainWindow->new;
$mw->Label(-text => 'Hello, world!')->pack;
$mw->Button(
    -text    => 'Quit',
    -command => sub { exit },
)->pack;
MainLoop;
