==================
Working with Files
==================

.. contents::
    :local:

We are constantly working with files while navigating the 
terminal during our research, here are some of the ways 
that we can do that:

touch - Crating an Empty File
*****************************

``touch`` is a very simple program that allows you to create a new,
empty file. The general syntax is

.. code:: shell

    touch [options] filename

Without any options, the file will simply be created with no
contents. You can also use the available options with the touch
command to update the date/time the file was modified with the
``-m`` command. On some clusters, especially supercomputers,
they have built-in commands that automatically delete any files
that have not been modified/changed in the last 30 days. With
``touch`` you could setup a script that will automatically touch
all your files and update the modified date/times so the
supercomputer does not automatically delete them.

vi - Reading and Writing in the Terminal
****************************************

General Concepts
^^^^^^^^^^^^^^^^

You should already know the basics of using ``vi`` (also known as
``vim``) for text editing, but I wanted to cover a few more useful
parts of ``vi`` that you may not be aware of. You should already
know that you can open ``vi`` to create or edit any file by typing

.. code:: shell

    vi filename

Once inside the ``vi`` text editor, you can navigate around using
letters on your keyboard

* H key – move left
* J	key – move down
* K	key – move up
* L	key – move right

These will always work in ``vi``. You can also usually just use
the arrow keys on your keyboard, but occasionally you may login
to a computer where ``vi`` does not recognize the arrows on your
keyboard and then you will need to use the H thru L keys on the
keyboard.

Below are some other helpful commands/tips that can be used within
``vi``. Once you start working your way through these you will
start to notice patterns with the commands that will hopefully
make them start to make more sense.

* To move your cursor to the end of a word, press ``w``.
* To move your cursor to the very end of a line/row, press ``Shift+4``.
* To move your cursor to the beginning of the current line/row, press ``0``. That is a zero, not an o.
* To move your cursor to the last line of the file, press ``Shift+G``.
* To page down, press ``ctrl+F``.
* To page up, press ``ctrl+B``.
* To move your cursor down 6 lines, press ``6`` and then the down arrow (or J key)
* To move your cursor up 8 lines, press ``8`` and then the up arrow key (or K key)
* To move your cursor over right 5 characters, press ``5`` and then the right arrow key (or L key)
* To move your cursor over left 3 characters, press ``3`` and then the left arrow key (or H key)
* To delete the letter your cursor is currently on, press ``x``.
* To copy the current line of text, press ``yy``.
* To copy 4 lines (the current line plus the 3 following lines) of text, press ``4yy``.
* To copy the current line and every line until the end of the file, press ``y``, then ``Shift+G``
* To paste a copied line (or lines) of text, press ``p``.
* To delete the current line of text, press ``dd``.
* To delete 4 lines (the current line plus the 3 following lines) of text, press ``4dd``.
* To delete from where your cursor is currently, to the end of the word, press ``dw``.
* To delete from where your cursor is currently to the end of the line, press ``d``, then ``Shift+4``
* To delete from the current line to the end of the file, press ``d``, then ``Shift+G``
* To display the line number for each row of text, type ``:set nu`` and press enter.
* To undisplay the line number for each row of text, type ``:set nonu`` and press enter.
* To jump to line 453 in the file, type ``:453`` and press enter.
* To search for a string of text, type ``/string`` and press enter. Each instance of string should be highlighted.
* After searching for a string, you can jump to the next matching string by pressing the ``N`` key.
* You can jump to the previous matching string by pressing ``Shift+N``.
* You can scroll through you previous searches in ``vi`` by typing a slash (/) and then scrolling through the old searching using the up arrow key.
* To find and replace all instances of a string, type ``:%s/old_text/new_text/g`` and press enter.
* To find and places all instances of a string only on the current line, type ``:s/old_text/new_text/g`` and press enter.
* You can scroll through your previous commands (even from now-closed Terminal windows) by typing a colon (:) and then scrolling through the old commands using the up arrow key.
* To undo your most recent change/edit, press the ``U`` key. This can be done multiple times.
* To save changes without quitting ``vi``, type ``:w`` and press enter.
* To quit without saving changes, type ``:q!`` and press enter.
* To quit and save changes, type ``:wq`` and press enter.

It may also be helpful to know about swap files. When you use
``vi`` to edit a file, you are not actually editing the actual
file. ``vi`` creates a swap file that stores all your changes in
that file, and then if you decide to save those changes, ``vi``
will replace the original file with the swap file that contains
your edits. If you use ``vi`` to edit a file called ``file.txt``,
then ``vi`` creates a swap file called ``.file.txt.swp`` where
your edits are stored. Notice that the filename starts with a
dot (.) meaning the file is hidden (although you can see it
with ``ls`` using the ``ls -a`` command). Also, you can only
have one swap file for a given file at a time. For that reason,
try to make sure you always close out of your file before
exiting the terminal.

Modes
^^^^^

The ``vi`` program has several available modes/options that help
you edit a text file. The ones that I will cover here include
Insert, Macro, and Replace.

Insert
######

The Insert mode in ``vi`` is used to, you guessed it, insert new
text. To enter insert mode, press the ``I`` key on your keyboard.
Once you do this, and while you remain in insert mode, the bottom
of your Terminal window should say

.. code::

    --INSERT--

This mode will allow you to insert new text and use the backspace
key just as if you were in a text editor you are more familiar
with (i.e. that word processing program that shall remain
nameless). The only difference is that you will not be able to
use your mouse to move your cursor around. Simply stick to using
the arrow keys. Pressing ``I`` will allow you to enter Insert
mode in the exact place where your cursor is currently. However,
you can also press the ``A`` key on your keyboard to enter
Insert mode. The difference is when you press ``A``, you will
enter Insert mode and your cursor will move to the position
immediately to the right of its current position. This is
helpful when you are at the end of a line and you want to add
new text. Once you are done making your edits, you need to exit
Insert mode by pressing the ``Esc`` key on your keyboard.

Macros
#######

A helpful but slightly more advanced technique is creating
macros (a shortcut to a task you do repeatedly) in ``vi``.
You can easily use Insert mode to edit your text. But if you need
to make the same edit a thousand times it is a waste of your time
and effort to do that by hand. Instead, you can create a macro to
do it for you. Let’s say I have a file that contains the same
line repeating over and over for 10 lines.

Now let’s say we want to change part of that line to something
else, but for only every other line (if it were all lines we
could just use the find and replace option shown previously
using ``:%s``). For this situation, we could setup a macro to do
it for us. Pressing the ``Q`` key on your keyboard (while not in
any other modes, such as Insert, obviously) tells ``vi`` that you
want to start a macro. Then press one letter/number on your
keyboard that will be the ‘name’ of that macro for this ``vi``
session. I typically press the ``A`` key because it’s the first
letter of the alphabet and easy to remember. But if you are
creating multiple macros in the same ``vi`` session then you may
want to assign them letters that will help you remember what
task they perform. Once you press the ``A`` key (or whatever
letter/number you are assigning to this macro), you should see
the following appear in the bottom left corner of your Terminal
window

.. code::

    recording

This lets you know that ``vi`` is recording every move and change
you make. Before I pressed ``Q`` (and ``A``), I moved my cursor
over the first letter of what we wanted to change. This is
important because remember ``vi`` is recording every move you
make, including movements of your cursor. Once I have pressed ``Q``
and ``A`` so ``vi`` is recording, I type dw twice to remove two
words. Then I type ``I`` to enter Insert mode and type my new
desired phrase. I then press ``Esc`` to exit Insert mode, and
finally move my cursor so it is on the first letter of what I
want to change two lines down. At this point, I have finished
making my macro such that if I were to repeat the macro from my
current cursor position then my initial phrase would be replaced
by the new phrase and the cursor would be moved down two lines
again. Once you are done making your macro you need to tell ``vi``
that you are done by pressing the ``Q`` key again (the recording
in the bottom left corner of the Terminal window should disappear
now). ``vi`` has now saved your macro. To run your macro five
times, type ``5@A`` (i.e. press the ``5`` key, then press
``Shift+2``, and then press the ``A`` key on your keyboard).
After defining the macro and running it 5 times the text now
looks like what we wanted.

Replace
#######

The ``vi`` program has two different methods of text replacement.
The first is to only replace a single character in the text file.
If you press the ``R`` key followed by pressing the ``K`` key,
then the character your cursor was on will be replaced by a "K".
As an example, consider the following line in a text file.

.. code:: shell

    The mouse kissed the little boy.

If you place your cursor over the "b" of "boy" and then press the
``R`` key followed by the ``T`` key on your keyboard, the text
will change to

.. code:: shell

    The mouse kissed the little toy.

See how that works?

The other version of Replace is to enter an explicit Replace
mode where everything you type overwrites whatever was already
there (similar to the functionality of the Insert key on some
keyboards). To enter this replace mode you need to press
``Shift+R`` while in ``vi`` (and, of course, you cannot be in any
other modes at the time). Once you press ``Shift+R`` you will see
the following in the bottom left corner of your Terminal window

.. code::

    --Replace--

as a reminder that you are in Replace mode. Once again, while you
are in this mode, you can type and move around all you want, but
anything you type will overwrite any current text in the file.
To exit Replace mode, simply press the ``Esc`` key on your
keyboard (just like you do to exit Insert mode earlier) and the
"--Replace--" in the bottom left corner of your Terminal window
will disappear. Just like with Insert mode, you will need to exit
Replace mode before you can save any changes.

Visual
#######

``vi`` also has a Visual block mode available that you can
enter by pressing the ``V`` key on your keyboard, but I won’t go
into any detail about this mode now. I just want to mention
that it exists. If you want to know more information, Google it. :)


Reading File Contents
**************************

head - Reading the Start of a File
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``head`` command will print the top lines of a file to the
Terminal screen. The general syntax for the ``head`` command is
``head [options] filename``. By default, ``head`` will print the first
10 lines of the file you provide. This command can also be used to
print a different number of lines at the top of a file. For example,

.. code:: shell

    head -n 25 water_optimization.log

will print out the first 25 lines of the file ``water_optimization.log``.
Using the ``-n`` flag allows you to specify the number of lines printed.


tail - Reading the End of a File 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``tail`` is a simple command that prints the last lines of a file.
By default, ``tail`` prints the final 10 lines of a file to the
Terminal screen.

You can also use ``tail`` to print only a certain number of lines to the screen.
For example, if I only wanted the last 3 lines of a file, I could use
the ``-n`` flag preceeding a 3.

.. code:: shell

    tail -n 3 filename

You can also use the ``tail`` command with the ``-f`` flag if you
are running a calculation to update the end of the file as the
output is printed. So if you type

.. code:: shell

    tail -f logfile

the final 10 lines of ``logfile`` will be printed to the screen,
then as more lines are printed to ``logfile``, they will also show up
on the screen. This will continue until you signal the computer to
end the printing by pressing ``ctrl-c`` on the keyboard, which
terminates the ``tail`` command.

cat - Printing File Contents to the Terminal 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``cat`` command will print the entire contents of a file 
to the terminal window. You will be able to scroll in the 
terminal to see the start of the file, but unless ``more`` or 
``less``, the whole file is printed to the terminal at once.
You can use this command with:

.. code:: shell

    cat <filename>


less - Reading a File in the Terminal
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The less command provides users with the ability to read a file
without worrying about the chance of unintentionally editing the
file. The general syntax for less is

.. code:: shell

    less filename

When you execute a less command to read a file, the Terminal window
will be filled with the contents of the file (i.e. you will not be
able to see any of your previous commands in the current window).
You can scroll up and down to see the contents of the file using
the arrow keys on your keyboard. You can also page down using the
spacebar key, and page up using the B key (short for back) on your
keyboard. You can also search for instances of a certain word or
phrase by typing

.. code:: shell

    /text to search for

Once you press the slash key (/) your cursor will move to the bottom
of the Terminal window where you will be able to see what text you
are typing. Press enter to search the file for the text. Every
instance of the phrase should be highlighted. If you accidentally
press the slash key (or decide that you do not want to search for
the text you started typing, you can just backspace until the slash
is gone and you will be able to scroll through the text of the file
again.

You can also go straight to the end of a file by pressing Shift+G
on the keyboard.

To quit less just press the Q key (for quit).

more - Reading a File in the Terminal
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``more`` is an antiquated version of ``less`` that can be used
for reading (but not editing) files. Unlike ``less``, with ``more``
you can only page down (e.g. you cannot scroll line-by-line with
the arrow keys, and you cannot page or scroll up at all) and you
cannot search the text for a string of phrase.


sed - Editing Files in the Command Line
****************************************

Information for this section can be found on 
`this StackOverflow page <https://stackoverflow.com/questions/11392478/how-to-replace-a-string-in-multiple-files-in-linux-command-line>`_.

``sed`` is an extremely useful tool, especially to the two people
in the world that really know how to use it. And I am not one of
those two people. As you might be guessing from my previous
statements, ``sed`` is not an easy language to understand, but it
is still useful thanks to Google. Just knowing that ``sed`` exists
and the types of things it can do make it useful because you can
likely find someone else that has reported the exact thing you
want to do online. Below I have listed a few of the more common
``sed`` commands I have used on a regular basis and what they do.

Remove the first line of a file, often done to remove the
heading names of columns:

.. code:: shell

    sed '1d' filename

The results will be printed to the Terminal screen.

Remove lines 1 to 5766 in a file:

.. code:: shell

    sed -i '1,+5766d' filename

The ``-i`` in this case will delete lines 1 to 5766 and instead of
printing the results to the screen, will just save the results
in the original filename.

Find and replace the commas in ``filename`` with a space instead:

.. code:: shell

    sed 's/,/ /g' filename


Often when working with large amounts of data/jobs, you might 
accidentally make a typo that is now present in all of your 
files. There are a number of ways to correct this typo, but 
one of the easiest is to find-and-replace the erronous 
part of the file with the correct version.

If the problem is only in one file, it's easy enough to just 
``vi`` into the folder or open it in a text editor and fix it.
One way to do this is to find-and-replace-all with one of the 
commands that's a part of ``vim``:

.. code:: shell

    :%s/string_to_find/replacement_string/g

This code will find every instance of "string_to_find" in your 
file and replace them all with "replacement_string". The "g" 
at the end of this command is what tells ``vi`` to replace 
EVERY instance of the string, rather than just the next one 
(if this is what you want, just leave out the "g")

.. note::

    This is an example of the ``sed`` command, just one that's
    already incorporated into ``vim``. To use this feature, just 
    make sure you aren't in ``Insert`` mode or anything else by 
    pressing ``esc``.

If this is an error that exists in all of your files, it can be 
tedious to go into every file, make the change, save it, then 
move onto the next one. This is where the ``sed`` command comes 
in handy.

With this command, you can find and replace a string into several
select files in your directory. For example, if you have a lot 
of Gaussian input files where you accidentally forgot to include 
your solvent, you can use the following command:

.. code:: shell

    sed -i 's/m062x 6-31+G* opt freq/m062x 6-31+G* opt freq scrf=(smd,solvent=water)/g' *com

This command will replace the incorrect route line with the corrected 
version in all files within the directory which end in "com". 
``m062x 6-31+G* opt freq`` is the original line with the error, while 
``m062x 6-31+G* opt freq scrf=(smd,solvent=water)`` is the corrected 
line. This 
is a fast, easy way to make sure that you are running jobs at the 
desired level of theory, or if you decide that you want to repeat the 
calculation with a different basis set/functional/solvent.

Again, there are lots of other uses for ``sed`` that aren't listed.
Many introductions and tutorials for ``sed`` can be found online.
And if you do actually learn how to actually use ``sed``, please
write it up here. :)

.. warning::

    It is possible if working on BSD systems like MacOS 
    that you might need to include the additional extension 
    ``-i '.bak'`` in your command to avoid risking corruption 
    or partial content.



Condensing Files/Folders 
************************

tar
^^^

Often if you are asked to package up some of your files to send to
someone else, they will request you send them a tarball. Don’t be
scared, this is not an athletic term that you haven’t heard of
before. A tarball is a file created using the ``tar`` command that
often contains several files and/or folders. Repackaging a bunch
of files into a single file makes them easier to distribute.
For example, if you download the source code for a program, you
will most likely be downloading a tarball of all the files. A
tarball also gives you the opportunity to zip all the files to make
the tarball smaller than the combined sum of all the files
individually, which is also helpful for distributing files. The
general syntax for tar is

.. code:: shell

    tar [options] tarball.tar folder/files

You can either ``tar`` up a folder (or several) and/or a bunch of
files, although it is more common to put all the files into a single
folder and then make a tarball of the folder. This makes it more
convenient for whoever unpacks the tarball you are creating.

The same command, ``tar``, is used to both make the tarball and
unpack the tarball, which means the options are important here. Most
often I will use the following tar command to create a tarball

.. code:: shell

    tar -zcvf tarball.tgz folder/

Notice that the end of the file is now marked with a ``.tgz``
instead of ``.tar``, and that is because we have zipped
(the ``z`` from -zcvf) the folder and its contents. The ``c``
option is signaling that we want to create a tarball. The ``v``
option makes the process verbose (i.e. it prints as much
information as possible during the process), and the ``f`` option
lets ``tar`` know we want to put the contents into an archive
file (that we call ``tarball.tgz``).

Furthermore, to unpack a tarball we will use the exact same
command, but instead of using the ``c`` option to create a
tarball we use an ``x`` flag to extract the contents of a tarball.

.. code:: shell

    tar -zxvf tarball.tgz

Notice that we don’t need to include the final folder/file since
we aren’t creating the tarball here, we are just extracting it.
Also, if the ``tarball.tgz`` was alternatively named ``tarball.tar``
(an indication that it was not zipped), then you would not need
to use the ``z`` flag.

Finally, using the ``-z`` compresses the files using ``gzip``
Tarballs can also be zipped using ``bzip``, and in that case you
will need to replace the ``-z`` flag with a ``-j`` flag.

zip
^^^

``zip`` is similar to ``tar``, where it compresses the files you 
specify into a smaller file which can be unzipped later on. This 
is a helpful way to transporting/sharing large amounts of data or 
whole folders of information. The way that you use this command is:

.. code:: shell

    zip name_of_zip_file.zip <files to be condensed>


Looking for Patterns
********************

grep - Print Lines Matching a Pattern
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``grep`` is a very useful tool for searching a very long file for
a certain string and printing the results to the screen. The
general syntax is

.. code:: shell

    grep pattern file

An example might be searching through a long Gaussian output file
to make sure that your calculation finished normally. An example of
this might be

.. code:: shell

    grep "Normal termination" water_optimization.log

In this case, I have searched through the file water_optimization.log
for the string "Normal termination". This string is printed in the
file when the calculation finsihed normally/without error. This can
also be done to search for energies or timing information.

awk - Pattern Scanning
^^^^^^^^^^^^^^^^^^^^^^^

``awk`` is a language for pattern recognition and scanning.
This is particularly useful when performing analysis and printing
out a bunch of values and potentially even doing simple math
on those values. For example, if I have a file with lots of
columns of text and numbers, but I am only interested in the contents
of one column, say the first, then I can use ``awk`` to give me
only that information.

.. code:: shell

    awk '{print($1)}' file_of_interest.txt

This command will print the first column from the file of interest
to the Terminal screen. You can also do basic math (if that column
contains numbers) using typical python math symbols. For example,
to multiply the value in the first column by 4, you could type:

.. code:: shell

    awk '{print($1*4)}' file_of_interest.txt

sort - Sorting and Re-Ordering Data
***********************************

The ``sort`` command does exactly what its name implies - it sorts
the lines of text files and puts them in a specific order. The
general syntax is

.. code:: shell

    sort [options] filename

If you have a file of data with 8 randomly placed numbers in it,
the data can easily be re-ordered using ``sort``.

By default, sort will rearrange the values and places them in
ascending order. You can use the ``-r`` flag to reverse the order
and put the values in descending order. You can even use ``sort``
to randomly reorder the values with the ``-R`` flag.

Additionally, you can also ``sort`` "human readable numbers" such as
2k (2,000) or 3M (3,000,000) using the ``-h`` flag.

``sort`` also has the ability to order letters and words
alphabetically. Consider a file that contains a bunch of types of
animals. ``sort`` will automatically reorder them alphabetically.

