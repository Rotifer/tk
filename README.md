# README for Tk repo

Some example scripts using the __Perl Tk__ and __Python Tkinter__ library for simple GUI development.
Both Perl and Python use the same underlying tk library and their respective implementations provide 
broadly equivalent functionality. Although the syntax is different between the two implementations, mastery
of Tk in either lanfuage should be provide you with the ability to read, and translate the code to the other language
Tk is old and doesn't support a lot of modern GUI functionality but it is:

1. Simple but adequate for many tasks
2. Well documented
3. Cross-platform
4. Quite easy to learn
5. Good for prototyping
6. Ideal for practicing application design and coding patterns such as callbacks

## Requirements

### Perl

1. Install Tk itself

```{console}
cpanm install Tk 
```

2. On my Mac, I need X Quartz. Install from [here](https://www.xquartz.org)

### Python


- Create a virtual environment and activate it

```{console}
python3 -m venv  ~/myperl/tk/python_tkinter/.venv
source .venv/bin/activate
python
```

- In venv Python

```{python}
import tkinter
```


