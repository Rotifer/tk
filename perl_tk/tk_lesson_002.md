# Lesson 002

- Bundling all the GUI code into an unstructured script does not scale very well
- Scripts such as the ones shown in the previous lesson are fine for demostration purposes to explain ideas and showcase various widgets
- For larger applications, we need more structure
- Object oriented programming gives us a mechanism to organise our code 
- Admittedly Perl OOP is not the best but it is better that the alternatives that I have seen where scripts are cobbled together without any structure


__lesson002_eg001.pl__

```{perl}
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
```

When executed, the code above produces the GUI shown below (I have stretched it out by selecting the bottom right edge and dragging the cursor)

![Display _%ENV_ values](https://github.com/Rotifer/tk/blob/main/perl_tk/img/lesson002_eg001.png)

