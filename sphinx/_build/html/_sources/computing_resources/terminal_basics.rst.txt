========================
Terminal Basics 
========================

.. contents::
    :local:

Here is a page that will have some introductory information 
about navigating the terminal and working in the command line.

Using Wild Cards
****************

Unix recognized certain "wild-cards". If you have a number of files
named in a similar way or all containing the same variables.
For example, after running Gaussian jobs, you might want to work with
only the output files. Rather than typing the full name of each file,
you know that the output files all end in ".log". You can use this
information to list all of your output files with the command ``ls *.log``.
This command will list all of the files in the working directory that
end in ".log". The asterix (*) serves as a wild card.
You can place the wildcard anywhere in the filename and it will work
the same way. So if you have many files that start with "molecule" and
end with ".com", you can list all of these files with ``ls molecule*.com``.
Similarly, if you want to list all of the files that contain a "2" in
the name, you can list them with ``ls *2*``. The wild card can be a
very useful tool that will save a lot of time.

Navigating Folders 
******************

In the terminal, navigating around different folders might 
be a little different than you're used to. Since everything 
is printed out to the terminal, and you have to explicitly 
navigate between different folders, it's importan to learn the 
commands which allow you to do this.

cd - Change Directory 
---------------------

``cd`` stands for "change directory," so it should be pretty easy to 
remember. This is also an `Essential Unix Command<https://csu-theory-suite.github.io/theory-suite-wiki/computing_resources/essential_unix_commands.html>`_ 
in case you want more details. 

The general use for this command is:

.. code:: shell

    cd desired_location/

where you "change directory" to the desired location that you specify. 

A few helpful tips for the syntax that is used, ``.`` is the current 
directory that you are in, and ``..`` is the previous directory. 
For example, if your file system layout is ``Users/CamRam/Desktop/Research/`` 
and you are in the ``Desktop`` folder, you can reach:

* ``CamRam/`` with ``cd ../``
* ``Desktop/`` with ``cd ./`` (not really necessary)
* ``Research/`` with ``cd Research/``
* ``Users/`` with ``cd ../../`` (you can "stack" these folders to do multiple at a time)

In addition to these "local" commands, you can distinguish everything 
globally. So getting to ``Research/`` would be ``cd /Users/CamRam/Desktop/Research/``.


pwd - Print Working Directory 
-----------------------------

``pwd`` will print the current directory that you are in, the 
"current working directory." This is helpful for transferring files 
or figuring out how far back to change your directory to.
This is also an `Essential Unix Command<https://csu-theory-suite.github.io/theory-suite-wiki/computing_resources/essential_unix_commands.html>`_ 
in case you want more details. 


Redirecting Output to a File
****************************

When you run a command and the results are printed to Terminal
window screen, the text printed is called standard output.
Occasionally it is helpful to save the standard output to a file.
Of course, you can always copy and paste the results into a file
by hand after it is printed to screen, but this can be very
difficult and tedious if the file is large. Thus, it can be helpful
to know that if you add a greater than sign (>) at the end of a
command followed by a new file name, the standard output will be
redirected to that file instead of being printed to the screen.

For example, you can type ``echo "This is my text."``.
When you execute this command, "This is my text." will print in the
terminal. If you want to save your output to a text file, you can type
``echo "This is my text." > my_text.txt``. This will write the string
"This is my text." into a new file called my_text.txt. This can be
helpful if running packages such as GoodVibes or CREST to ensure
that the output from those calculations is saved.

You can also use two greater than signs (>>) to append your output
to the end of a file. If you wanted to add another line to my_text.txt,
you could type ``echo "Here is more text." >> my_text.txt``, which will
append your new line of text to the end of ``my_text.txt``.


Creating Shortcuts for Common Commands
**************************************

The ``alias`` command allows users to create shortcute for
certain commands to limit the amount of typing necessary.

One of the most useful commands available to users is the alias
command. Basically, this command allows you to setup a shortcut
command for anything you commonly type (excluding your password).
This is helpful for a lot of different applications. The general
syntax for setting up an alias in bash shell the syntax is
``alias shortcut=’full command name’``

As an example, if you want to ssh to ACME, you would normally need
to type

.. code:: shell

    ssh $username@acme.chem.colostate.edu

but you could setup an alias using the following command:

.. code:: shell

    alias acme=‘ssh username@acme.chem.colsotate.edu’

and now every time you type marcy it is the same as
typing the full ssh command.

You can type the alias on the command line of a Terminal window,
but then the command is only useful as long as that Terminal window
is open. This command gets the most use when you place the command
in your .bashrc file. So if you add the alias command as a separate
line in your .bashrc file, save the changes, and source your
.bashrc by typing ``source ~/.cshrc``. You can use this alias command in every new Terminal window you open.

An alias can also be used in conjunction with other commands
and options.  For instance if you have an alias setup for ls
such as

.. code:: shell

    alias lt=‘ls –lthr’

You are not restricted to just using lt by itself. Suppose you
only want to list all of the files in a directory that start with
the letter f. Then you can simply type

.. code:: shell

    lt f*

And this will list all files as if you had fully typed

.. code:: shell

    ls –lthr f*

This is a very simple example of the use of an alias with another
option/command, but this sets the stage for you to have even more '
flexibility when creating your alias shortcuts.


Clearing the Terminal Screen
****************************

Occasionally your Terminal screen will be filled with a bunch of
text that you do not need to look at, and it can be distracting
if you are trying to run a new command where you want to look at
the new output and do not want to be confused with previous commands
and output. For this, unix allows you to press ``ctrl+L`` and this
will your Terminal window screen. You could still scroll up and
view the previous commands/output, but the part of the Terminal
window that is visible to you is cleared and the command prompt
is at the top of the screen ready for the next command.

The command ``clear`` will also clear your Terminal screen,
but you will not be able to scroll back up to see your previous output.

Search Previous Commands
************************

While on a Terminal prompt, if you press ``ctrl+r`` on your keyboard
you will be able to search through your previous commands, with the
most relevant (recent) command being entered on your command line.
Once you press ``ctrl+r`` your prompt will move up a line and the
letters "bck:" will be on the bottom line of your window. The bottom
line is what you are back-searching for (i.e. the text that you
will enter), while the text on your command prompt is the most
relevant recent command you entered that fits the search criteria.
For example, if I search for crest - on ACME, the most recently
used command with crest - in it is printed to the screen. Once you
find the command you want, you can press enter to execute the command.

You will need to remove those characters prior to executing the
command. You are now free to modify the command as you would
like and press enter when you are ready to execute it.

If at any point you don't find what you are looking for or decide
that you don't want to search your previous commands, you can
always press ``ctrl-c`` on your keyboard to terminate the search.

Additionally, you can use the up arrow to go back to the most recent 
command and "scroll up" that way. This is tedious when the command 
you want is very old, but works well if repeating commands a lot.

The ``history`` command will print out your recently executed commands.
By default, history will print out your most recent ~1000 commands.
You can also specify that history only print out a certain number
of your recent commands by putting a number after history.
For example, ``history 10``
will print the most recent ten commands that you entered.


Display a Line of Text
**********************

``echo`` is a very simple command that is used to print text to
the screen. A common reason to use ``echo`` is to display the
definition of an environment variable.

``echo`` can also be used when writing scripts. It can be helpful
to use ``echo`` statemetns to show how far along the script has progressed
or to print out a statement at the end to tell that the calculation
is done and how long it took to complete. ``echo`` works similarly
to print statements in python.

How to Logout
*************

Typing the ``exit`` command will log you out of any remote computer
you have connected to using ssh. If you type ``exit`` on the command
prompt of your local workstation, you will close that Terminal
window/tab.

Auto Fill Unique Names
**********************

This is a helpful tip and not a command. Whenever you are
maneuvering directories and trying to access a file or folder,
you should be aware that you can press the ``tab`` button on your
keyboard at any point to auto fill your command with a unique name.
For example, consider a situation where you have three files in a
folder called ``states.dat``, ``energies.dat``, and
``states_and_energies.dat``. If you want to ``cat`` the contents
of the ``energies.dat`` file, you could type ``cat e`` and then
press ``tab`` and the computer will auto fill the rest of the
command to

.. code:: shell

    cat energies.dat

since there are no other options in that folder that begin with
an "e". If you wanted to ``cat`` the contents of ``states.dat``
you could type ``cat s`` and then press ``tab`` and the computer
would auto fill until there was a difference in the two files,
and thus your command prompt would say

.. code:: shell

    cat states

At this point, if you type a dot (.) and then press ``tab`` again
it will auto fill the command to completion (``cat states.dat``)
since that is the only file that is in that folder that begins
“states.”.

Listing Files
****************************

You should already know how to list files with the ``ls`` command,
but there are many options with ``ls`` that can be useful. For
example, if you type

.. code:: shell

    ls -a

then you will see a list of all folders and files contained
within your directory, this includes hidden files that start with
a dot (for example, .bashrc).

If you want to list all the details (permissions, date modified,
owner, size, etc.) of all files, you can type

.. code:: shell

    ls -l

If you type

.. code:: shell

    ls -r

the order of the list will be reversed from the traditional
ordering. Typically ``ls`` will order the files in alphabetical
order, but typing ``ls –r`` will list them in reverse alphabetical
order. Another useful option is ordering the files/folders by
time instead of alphabetical order, which can be done using

.. code:: shell

    ls -t

You can also combine these options into a single command. For
example,

.. code:: shell

    ls -ltr

will list the details of all files and put them in reverse order
of the last time they were modified (so the most recently modified
file is on bottom). My problem with the previous command is the
size of the files is given in units of bytes, and that is not very
helpful for large files. So when I want to list the details of
all the files in a given folder I typically use the ls command

.. code:: shell

    ls -lthr

where the additional ``h`` puts all folder/file sizes in
human-readable format.


Canceling a Command Before you Execute
**************************************

At any point while on the command line if you want to effectively
cancel whatever you are planning on executing, simply press ``ctrl+c``
and your command will be cancelled and you will be sent to the next
line of the command prompt where you can begin another command.

Additionally, if you ever execute a command and realize that you
do not want to run it, instead of waiting for it to complete, you
can just press ``ctrl+c`` to cancel the process (assuming it is still
running).


Back to the Beginning of the Command Prompt
*******************************************

While you are typing a command on the Terminal prompt you may
get near the end of writing a command that is very long and have
the desire to go back to the beginning of the command to change
something. In this situation, if you press ``ctrl+a`` your cursor
will immediately be moved to the very beginning of the command
at the start of the prompt.


Combining Commands into a Single Line
*************************************

“Pipe” is a very helpful tool to know to help you combine commands
into a single line, simplifying scripts and generally making life
easier. “Piping” simply refers to the process of relocating the
output of some command immediately to the input of another command,
which you can do over and over. This is best explained using an
example. For instance, let’s say I have a directory with a lot of
files in it.

Now, let’s say I want to get the file size information from for
all files starting with 3HT3 and contain buckle in the name. I can
first do an ``ls -lthr`` to list the details of all the files in this folder,
then grep for the
3HT3 pattern, then grep for the buckle pattern, and finally print
out only the column of information with the file sizes using ``awk``.

.. code:: shell

    ls -lthr | grep 3HT3 | grep buckle | awk '{print($5)}'

And now I can easily look at only the file sizes that I want to
look at. Of course, this is basically a silly example that I could
have done much easier, but I just wanted to show how pipes work.
In this case, the “pipe” is the vertical line (|) between each
command. You can use the keyboard make a pipe by pressing shift and
the button right under the backspace button, as shown on the
keyboard below.

