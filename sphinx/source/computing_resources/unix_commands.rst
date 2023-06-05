=====================
Helpful Unix Commands 
=====================

.. contents::
    :local:

This page serves as a unix manual to help users get to know unix
commands and allow for more efficient research in the command line.

Most of the information on this page comes from Dr. Bill Miller III at Truman State University.

Essential Commands
------------------

Here are some of the most important/frequently used commands.
These are the basics to using linux machines and working on the command line.

.. list-table:: Essential Linux Commands
    :widths: 10 5 20 10
    :header-rows: 1

    * - Command
      - Option (appendage)
      - What it does
      - Example
    * - cd
      - 
      - Changes the working directory to the home directory (a folder named your net id)
      - ``cd``
    * - 
      - ``..``
      - Changes the working directory to the folder containing the current working directory.
      - ``cd ..``
    * - 
      - ``[destination directory]``
      - Changes the working directory to the one specified (destination directory)
      - ``cd /home/$USER/project``
    * - exit
      - 
      - Exits the current working network point. If you are logged into a node on ACME, this command will move the working location to the head node on ACME.
      - ``exit``
    * - ssh [cluster name]
      - 
      - Moves working location onto another computer in the network
      - ``ssh $USER@acme.chem.colostate.edu``
    * - pwd 
      - 
      - Returns the current working directory.
      - ``pwd``
    * - ls 
      - 
      - Lists all of the folders and files in the working directory.
      - ``ls``
    * - cp [file 1] [file 2 or different directory]
      - 
      - Copies file 1 and makes a duplicate in the same working directory named file 2 **OR** makes a copy of file 1 in the different specified directory.
      - ``cp test.txt test_copy.txt`` **OR** ``cp test.txt test_files/``
    * - 
      - ``-r`` 
      - Same as the previous, but allows the copying of folders (including their contents) too.
      - ``cp -r folder1/ desired_location/`` **OR** ``cp -r folder1/ /home/$USER/project_folder/``
    * - spc [file] [cluster]
      - 
      - Copies files to another computer in the network. The ``-r`` option works for secure copy as well.
      - ``scp file.txt $USER@acme.chem.colostate.edu``
    * - mv [item] [destination]
      - 
      - Moves a file (or folder if using the ``-r`` option) to the specified location. This is also how to change the names of files.
      - ``mv test.txt project1/`` **OR** ``mv test.txt water_test.txt``
    * - rm [file]
      - 
      - Deletes a file.
      - ``rm test.txt``
    * - 
      - ``-r`` 
      - Deletes a folder.
      - ``rm -r test_folder/``
    * - mkdir [folder name]
      - 
      - Makes a folder.
      - ``mkdir test_folder``
    * - rmdir [folder name]
      - 
      - Deletes an EMPTY folder.
      - ``rmdir empty_test/``
    * - less [file name]
      - 
      - Opens a file for viewing only. Once viewing the file, ``shift + g`` will take you to the bottom of the document (g alone will take you to the top). Typing ``?[text]`` will search the document for instances of [text] above the current cursor location. ``q`` quits.
      - ``less output_file.log``
    * - vi [file name]
      - 
      - Opens a file for viewing or editing. Files start in viewing mode. While in viewing mode, type ``dd`` to delete the line on which the cursor resides. To enter insert mode type ``i``. Once in insert mode, you can make changes to the test. To exit insert mode, hit the esc key. To save and quit, type ``:wq`` and hit enter while not in insert mode. To quit without saving, type ``:q!`` then hit enter.
      - ``vi input_file.log``
    * - cat 
      - 
      - Prints the content of the file to the terminal. This is only for viewing the file.
      - ``cat output_file.log``

File System Layout
------------------

As you get started, you should have an idea of how the files are organized on your computer.

Root Directory 
**************

If you change to the top-most directory (``cd /``), and list (``ls``) 
all the files there. This is called the root directory. All of the 
computer’s files are located in subdirectories of this folder. 
Most Unix computers are designed so that only administrators, 
also called ‘root’, can make changes in this directory. 
You do not need to know what is within most of these folders 
since they pertain to the operating system and are not something 
you can change without being root.

Bin Directories
***************

As you get more familiar with Unix, you will notice that one of the 
most important folders are called bin directories. 
These directories contain programs and can be executed to perform 
certain tasks. For example, if you cd to the root bin directory 
(``cd /bin``) and ``ls`` you will notice there are a bunch of 
different programs in this directory.
They are all executable (any file with an asterisk (*) at the end 
of the name is designated as executable), which means you can run 
the program. Most of the programs here are unimportant for our 
immediate purposes, but if you look closely, this folder contains 
several programs that you are already familiar with. For example, 
when you listed all the files in this directory, you typed ``ls``. 
Guess where the ‘ls’ program is located? In the /bin/ directory! 
So every time you type ``ls`` you are actually executing the ls 
program in this folder, which lists all the files in your current 
directory. Other programs in this directory you already know 
include mkdir, rm, mv, and vi. This manual will actually introduce 
you to several more programs within this directory later. 
There are actually multiple bin directories on computers that 
include different programs that you already know and will learn 
about through this manual:

* ``/bin/``
* ``/usr/bin/``
* ``/usr/local/bin/``
* ``sbin/``

Home Directory 
**************

Within the root directory, there is a subdirectory called home that 
contains folders for all users allowed to access the computer. 
When you open a brand new Terminal window, you will find yourself in 
your home directory (/home/$USER/). So if you change directories 
immediately, you should do so knowing that you begin in your home 
directory. You can also access the files in any other user’s home 
directory by changing to their directory in the /home/ folder.  
You can change directories to the home directory using the following 
command: ``cd /home/username`` 
You can also just type ``cd``. 
Typing cd without anything following it will automatically take you 
to your home directory. Another equivalent command would be 
``cd ~/`` 
which will also change directories to your home directory. Another 
interesting note is that you can easily get to other user’s home 
directories using the tilde.

Helpful Commands and Tips 
-------------------------

This section contains many different commands and Unix tips that
may be useful. The idea is to introduce them and provide some basic
usage/examples to help with understanding, but this will not be
an exhaustive explanation of the commands.

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
append your new line of text to the end of my_text.txt.

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

    alias acme ‘ssh username@acme.chem.colsotate.edu’

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

Pattern Scanning
****************

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

Back to the Beginning of the Command Prompt
*******************************************

While you are typing a command on the Terminal prompt you may 
get near the end of writing a command that is very long and have 
the desire to go back to the beginning of the command to change 
something. In this situation, if you press ``ctrl+a`` your cursor 
will immediately be moved to the very beginning of the command 
at the start of the prompt.

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

Disk Usage Details
******************

Our computers only have a limited amount of storage, so it is useful 
to know the disk usage details for our entire computer, as well as 
folders on our computer. For this purpose we use the du command. 
Typing the command ``du -h`` will print the size of every 
subfolder within your current directory and print out the final 
disk usage at the end. If you have many directories and 
subdirectories within your current folder, the list printed to 
the screen can become quite large.

The ``-s`` flag is intended to help remove all of the mess 
and just give you the final details if that is all you want. 
This is useful if you only care about the total size of a directory 
and don't care about the size of individual subfolders.

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

Search for Files
****************

The ``find`` command searches a directory/path for files that match the 
given expression provided by the user. The general syntax is 

.. code:: shell
    
    find [path] expression 

This command has a LOT of options. 

An example find command is shown below to give you an idea of 
what find can do. 

.. code:: shell

    find $HOME -mtime 0 

This command will search for files in your home directory that 
have been modified in the last 24 hours.

``find`` is also capable of executing arbitrary bash commands with the 
filenames it finds:

.. code:: shell
    
    find ./ -maxdepth 3 -mindepth 1 -name '*.com' -exec "cp {} ../../MoveFilesHere \;"

This command will parse through all folders 1-3 steps in the file 
tree, select all of the files that end in ".com", and run the 
``cp`` command to move those files into a new folder that you made.
The portion after the ``-exec`` can be any bash command you would like 
to run on the files you've found.

Print Lines Matching a Pattern
******************************

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

Printing the Beginning of a File 
********************************

The ``head`` command will print the top lines of a file to the 
Terminal screen. The general syntax for the ``head`` command is 
``head [options] filename``. By default, ``head`` will print the first 
10 lines of the file you provide. This command can also be used to 
print a different number of lines at the top of a file. For example, 

.. code:: shell

    head -n 25 water_optimization.log

will print out the first 25 lines of the file ``water_optimization.log``.
Using the ``-n`` flag allows you to specify the number of lines printed.

Viewing Your Recent Commands
****************************

The ``history`` command will print out your recently executed commands. 
By default, history will print out your most recent ~100 commands. 
You can also specify that history only print out a certain number 
of your recent commands by putting a number after history. 
For example, ``history 10`` 
will print the most recent ten commands that you entered. 

What Computer am I Working on?
******************************

When you can easily ssh from one computer to another it is easy 
to get confused and not know which computer you are working on. 
Thus, the command ``hostname`` was created to print out the name of 
the host computer you are actively working on.

Terminating Interactive Processes
*********************************

The ``kill`` command is used to terminate processes that you are 
running on your computer. The general syntax for the ``kill`` 
command is 

.. code:: shell

    kill -9 PID 

The ``-9`` is added to smother the process so it has no chance of 
survival. The ``PID`` is a number that identifies each running 
process. You can obtain the ```PID`` of any process using either the 
``ps`` or ``top`` commands. This should only be used on the local 
linux machines, as SLURM has it's own way to kill/cancel a job.

Read Files Without Editing 
**************************

Less
++++

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

More
++++

``more`` is an antiquated version of ``less`` that can be used 
for reading (but not editing) files. Unlike ``less``, with ``more`` 
you can only page down (e.g. you cannot scroll line-by-line with 
the arrow keys, and you cannot page or scroll up at all) and you 
cannot search the text for a string of phrase.

Different Ways to List Files 
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

What Processes are Running in my Terminal Window 
************************************************

ps 
+++

The ``ps`` command is similar to the top command, 
except instead of viewing all the processes that are running on your 
computer, ``ps`` will only display the processes that are running in 
your current shell/window. So clearly there are significantly less 
processes shown using ``ps`` than ``top``, but if you are running 
a bunch of 
processes that are executing the same command, ps may be a better 
way of displaying them for you if you need to terminate one of them. 
``ps`` is also not dynamic. When you type ``ps`` the current processes 
are 
just printed to the screen and the command prompt is available for 
another unix command.

top
+++

Occasionally it will be helpful to determine what processes are 
currently running on your computer. For this situation, we have 
the ``top`` command. ``top`` will display the processes currently 
running in your Terminal window. 
The processes are listed in descending order of %CPU usage. 
The display is dynamic and updates every ~3 seconds. While 
``top`` is being displayed, if you press 1 you will see the load 
on each specific processor. 

There are many columns of information displayed using ``top``, 
some of which are self-explanatory and some of which aren’t 
important to us. The ``PID`` column is an identifying number for each 
command. If you need to kill one of these jobs while ``top`` is 
running, press ``k`` and a line will be printed just above the 
processes that says ``PID to kill:``. You can enter the ``PID`` number 
and press ``enter`` to kill any of the jobs that are running. 
You can also see if any other users are running processes on your 
computer (someone might decides to try to hijack your CPUs or GPUs 
if they don’t think you are using them enough). top also allows 
you to view the percentage CPU (%CPU) and memory (%MEM) usage for 
each process, the length of time the job has been running (although 
this is not normal Earth time), and the name of the command that is 
running. 

Once you have finished examining top you can terminate it by just 
pressing ``q`` on the keyboard to quit (or pressing ``ctrl+c``) 

What Directory am I in?
************************

``pwd`` is a very simple and frequently used command in unix.
The command simply prints the full path of your current working 
directory to the screen in your Terminal window. At first this 
sounds fairly useless because why wouldn’t you know what directory 
you are in? Well, when you have many Terminal windows at once it 
can be difficult to remember where you are in each shell. 
Potentially more helpful, though, sometimes you need to copy (``cp``) 
or ``rsync`` files to or from a certain directory that requires you 
to explicitly list the pull path to that directory. If you type this 
by hand you could make several mistakes that are difficult to catch. 
It is much easier to just type ``pwd``, print out the directory and 
then just copy and paste it into your ``cp`` or ``rsync`` command.

Transferring Files 
******************

You may have already been introduced to the ``scp`` or ``ftp`` 
commands to transfer files, and that’s great, but rsync is better 
than both of them. ``rsync`` allows you the ability to zip files 
before they are transferred (and unzip them afterwards), so the 
transfer itself is quicker since the files to be moved are smaller. 
``rsync`` also automatically compares the files to be transferred 
and the destination to compare files. If there are any duplicates, 
rsync will not transfer those files, again saving you time. 
Similarly, if a file was simply added to or modified it will only 
transfer the new modified parts instead of transferring the entire 
file again, still saving time. And if you are in the middle of 
transferring files and you cancel the transfer or you lose 
connection, when you restart the transfer, ``rsync`` will 
automatically pick up where it left off so you don’t have to start 
back at the beginning. Sounds too good to be true, doesn’t it? 
Well, it’s not. It’s ggggrreeeeaaaaatttt! Anyone else see a big 
cartoon tiger say that? No, just me? Okay then. 

Anyway, how do you use ``rsync``? Well, ``rsync`` has a lot of 
options, but I typically use the following options 

.. code:: shell
    
    rsync -azvp --progress list_of_files username@computer:/path/to/folder/where/you/want/the/files/ 
    
For example, 

.. code:: shell 
    
    rsync -azvp --progress * username@acme.chem.colostate.edu:/home/usermane/
 
will transfer all files (*) in the current directory to my home 
directory on the ACME. You can also reverse the command and bring 
files from another computer to your current directory. For example, 

.. code:: shell

    rsync -azvp --progress ‘username@acme.chem.colostate.edu:/home/usermane/*’ . 

This will transfer all files in my home directory on ACME 
to the current directory (the dot specifies the current location) 
on my local computer. Different people use different options. These 
are helpful options because they zip the files prior to transferring 
and the ``--progress`` allows you to view the time remaining for 
each file during the transfer process.

Filtering and Modifying Text 
****************************

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

Again, there are lots of other uses for ``sed`` that aren't listed.
Many introductions and tutorials for sed can be found online. 
And if you do actually learn how to actually use ``sed``, please 
write it up here. :)

Tell the Computer to Wait 
*************************

The ``sleep`` command simply tells the computer to pause and wait for 
a user-specified amount of time. I have really only found this 
useful when writing scripts. The command does not return anything 
or print any output. The general syntax is

.. code:: shell

    sleep # 

where the number is the time you want the computer to wait for 
in units of seconds. To make the computer wait 3 seconds you would 
type 

.. code:: shell 
    
    sleep 3 

Wasn’t that useful? 

Remotely Accessing Computers or Clusters 
****************************************

The great part of computational work is that you should never have 
to leave your desk to do any work. You can be logged into a computer 
halfway around the world and you should be able to work as if you 
were there. The ``ssh`` command is what allows us this tremendous 
flexibility. The general syntax for ssh is 

.. code:: shell
    
    ssh [options] username@remote_computer_name 

If your username on your local computer and the computer you 
are trying to connect to are the same, then you do not need to 
include the ``username@`` part of the command. Instead, it would 
just be 

.. code:: shell 
    
    ssh [options] remote_computer_name 

For example, 

.. code:: shell
    
    ssh acme.chem.colostate.edu 

In the above example, no options were included and I will not go 
into detail about all the different options ``ssh`` has, but I 
did want to mention the options for X-forwarding. If you include a 
``-X`` or ``-Y`` flag between ``ssh`` and your destination, you 
will enable X-forwarding during your connection. What does that 
mean? That means you will be able to bring up GUIs (Graphical 
User Interfaces) on the remote computer and they will display on 
your local computer screen. So, for example, if you ssh to the 
overlap cluster using X-forwarding 

.. code:: shell
    
    ssh -Y acme.chem.colostate.edu 

You must be aware that since you are running these 
graphics remotely that anything you try to do will be slower than 
if you were doing it on your own computer.  

As a final note, there are subtle differences between using the 
``-Y`` and ``-X`` flag options, but for practical purposes you 
should not notice a difference and thus you can use either 
interchangeably.

Sorting and Re-Ordering Data 
****************************

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

Printing the End of a File 
**************************

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

Packaging your Files into a Single Combined File
************************************************

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

Create a New File 
*****************

touch
+++++

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

vi
+++

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

Running Previous Commands
*************************

While on the command prompt of your Terminal window you can press 
the up arrow on your keyboard and scroll through previous commands 
you have entered. This is especially helpful if you are executing 
the same (or similar) command to something you recently executed. 
You can use the up arrow to find the one you are looking for and 
modify it if necessary before pressing enter and executing the 
command.  

You can also view a list of all your recently used commands using 
the ``history`` command.

What Program am I Using?
************************

The which command can be extremely useful for determining: 

1) if a command is in your PATH and 
2) the exact path to the executable
   
For example, if you want to know if the vmd program is in your 
PATH, type 

.. code:: shell
    
    which vmd 

which should give the result 

.. code:: shell
    
    /usr/local/bin/vmd 

This tells you that vmd is in your PATH, so if you just type ``vmd`` 
the VMD program will open, and it tells you the VMD program that 
will open is located in ``/usr/local/bin``. This is important 
because sometimes you might have multiple copies of the same 
program on your computer. If I wanted to use the beta version of 
the VMD program I could download it from the VMD website and 
install it on my computer. I would then have to put the beta VMD 
bin directory in my PATH (using the instructions outlined in the 
$PATH section) so that when I type ``vmd`` I will open the beta 
VMD instead of the native VMD in ``/usr/local/bin/``. 
Typing ``which vmd`` will let you know exactly which VMD you are 
attempting to use.

Learn About the Computer
************************

Depending on the machine that you are working on, there may be 
a different architecture/setup of that computer. There can also be 
different numbers of CPUs that are available for use on different 
machines. One way to figure out this kind of information about the 
machine you are working on is with with command ``lscpu``. When you 
are on a linux machine, typing this command will give a lot of 
information about the computer. The results of this command are 
printed to the Terminal window. For example, typing 

.. code:: shell
    
    lscpu 
    
on Fireball of the Paton Lab gives the result: 

.. code:: shell 

    Architecture:          x86_64
    CPU op-mode(s):        32-bit, 64-bit
    Byte Order:            Little Endian
    CPU(s):                96
    On-line CPU(s) list:   0-95
    Thread(s) per core:    2
    Core(s) per socket:    24
    Socket(s):             2
    NUMA node(s):          2
    Vendor ID:             GenuineIntel
    CPU family:            6
    Model:                 85
    Model name:            Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz
    Stepping:              7
    CPU MHz:               3572.460
    CPU max MHz:           3900.0000
    CPU min MHz:           1000.0000
    BogoMIPS:              4800.00
    Virtualization:        VT-x
    L1d cache:             32K
    L1i cache:             32K
    L2 cache:              1024K
    L3 cache:              36608K
    NUMA node0 CPU(s):     0-23,48-71
    NUMA node1 CPU(s):     24-47,72-95
    Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid dca sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch epb cat_l3 cdp_l3 invpcid_single intel_ppin intel_pt ssbd mba ibrs ibpb stibp ibrs_enhanced tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm cqm mpx rdt_a avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local dtherm ida arat pln pts hwp hwp_act_window hwp_epp hwp_pkg_req pku ospke avx512_vnni md_clear spec_ctrl intel_stibp flush_l1d arch_capabilities  

This command should give you any of the information that you are 
looking for about a computer.

In Case You're Confused... 
**************************

In case you find yourself questioning your very existence and 
who you are as a person, you can always ask your computer. Typing  

.. code:: shell
    
    whoami 

will print the username you used to login to your computer. 

Running Commands
----------------

There are a couple different ways of running/executing commands 
and calculations. Typically, if you are going to execute a command 
straight from the command line on your local computer, then that 
is called running a command (or job/calculation) interactively. 
Interactive jobs run immediately after you execute them regardless 
of the other processes that are occurring already on the computer 
that it may or may not conflict with for the available resources. 
If you run a job on a cluster (or supercomputer) you are likely 
running the command through a queue where you have to share 
resources with the other users and the queue scheduler 
(which is a script/program itself, not a real person so don’t 
try to bribe the scheduler; he doesn’t need your money) 
distributes calculations to free compute nodes that have enough 
available resources to run the program. This section of the 
manual, though, will focus on running jobs interactively on a 
local computer/workstation. 

Scripts and calculations expected to take limited resources or 
very little time can simply be run from the command line without 
any real considerations. However, when calculations are expected 
to take long periods of times (i.e. more than a few minutes), 
I have a few suggestions that might help. 

Halting and Canceling Interactive Processes
********************************************

If you are running a job interactively (i.e. the command prompt is 
unresponsive will the command is running), then you can press 
``ctrl+C`` to cancel/kill the process at any time while it is running. 
This will terminate the job from running any longer. 

Additionally, you have the option to halt or suspend an interactive 
process while it is running using ``ctrl+Z``. In other words, you can 
press ``ctrl+Z`` while a command is running and this will temporarily 
suspend the process from running. It halts, but it is not killed. This 
allows you to use the Terminal’s command prompt again while the job is 
halted. At any point, you can continue running the job by typing ``fg`` to 
bring the command back to the foreground. 

Running in Background vs Foreground, and nohup
**********************************************

A typical, short calculation is run in the foreground. This means when you 
execute the command, the command prompt on your Terminal becomes unresponsive 
until the process has completed. For long processes, I suggest running commands 
in the background. This allows the job to continue running in the background 
(i.e. without you knowing any difference) and for you to be able to use that 
Terminal’s command prompt to do other things. 

To run a job in the background, simply append an ampersand (&) to the end of 
the command. So if I were going to run a Gaussian 09 QM calculation in the 
foreground, the command would simply be  

.. code:: shell
    
    g09 structure.com 

But if I wanted to run that same calculation in the background, the command 
would look like this 

.. code:: shell 
    
    g09 structure.com & 

When you press enter to run this command, a line will be printed to the screen 
letting you know the job is running 

.. code:: shell
    
    [1] g09 structure.com & 

At this point (i.e. after this previous line is printed to the screen), if 
you press enter again your cursor will be back on the command prompt and you 
will be able to use your Terminal window to do more unix-y (yeah, that’s a word) things. 

Occasionally, I accidentally execute a command without adding the ampersand at the 
end when I really wanted to run the job in the background. So instead of running in 
the background, the calculation is running in the foreground. In this situation, I 
press ``ctrl+Z`` to suspend the job. This means the job is simply waiting for you to 
let it know it can continue running. If you want the job to begin running in the foreground 
again (as it was originally), you could type ``fg`` (short for foreground). But if you 
are like me, and wanted to run the job in the background, simply type ``bg`` (short 
for background; see how they did that?) and press enter on the command prompt and the 
job will begin running again but now in the background (and you will get a notification 
line like the one mentioned above when I explained how to run g09 in the background). 

An extremely helpful program when running process in the background is the ``nohup`` 
command. ``nohup`` can be added at the beginning of any command and essentially what 
it does it ensure that your job continues running, even if you logout of your computer. 
This is especially helpful if you are using a public or lb computer that others users 
access, or if you are working remotely (i.e. ssh’d into another computer) because using 
``nohup`` means you can exit (or logout) the remote workstation and your process/command 
will continue to run. I use this frequently if I am running a command remotely just in 
case the connection between my computer and the remote computer is broken. If you do 
not use ``nohup``, when the connection is severed, your command will be terminated. 
Continuing with the Gaussian 09 theme, if we wanted to initiate a g09 calculation 
on a remote computer using nohup, the command would look something like this 

.. code:: shell
    
    nohup g09 structure.com & 

Notice that in addition to using ``nohup`` at the beginning of the command, we 
also made the process run in the background (using the &). If you run a 
command using ``nohup`` in the foreground, then you are defeating the purpose 
of using nohup altogether since you are unable to use your Terminal’s command 
prompt and when you close the Terminal window or the connection to the remote 
computer is lost, your calculation would be killed.

Listing and Killing Jobs Running in Background
**********************************************

I have already described to you how to run commands in the background. As long as 
you are still using the same Terminal window/tab you used to execute the background 
commands, you can type the command jobs to see what processes are running in the 
background. 

Two processes are distinguished by the [1] or [2] shown at the beginning of each 
line. If for some reason I wanted to kill the first job (which I could do 
using the kill command along with the corresponding PID number), 
I could simple type 

.. code:: shell

    kill %1

and press enter. Similarly, to kill the second job I would just type 

.. code:: shell

    kill %2

In the event I am running a job in the background, I find using jobs 
and ``kill %`` much more convenient than determining the PID 
number from ``top`` or ``ps`` and using the ``kill -9`` command. 

Fun with Coworkers
------------------

In this section I have included some commands that are not extremely useful for 
productive work, but can make work more enjoyable by sending messages to 
your colleagues. 

Send a Message to All Users' Terminal Windows 
*********************************************

The ``wall`` command works very similar to the ``write`` command, 
except that instead of sending a message to only one person’s 
Terminal window, you send that message to every Terminal window 
open by all users currently logged into that computer, including 
yourself. To initiate a wall message, type 

.. code:: shell
    
    wall 

This will bring you to the next line in your Terminal window. You 
can write as much or as little as you want. You can press enter to 
go to another line even; so you can send a multi-line message. 
Once you are done drafting your message, press ``ctrl+D`` on your 
keyboard to end the wall command and send the message to all users.

Notice that ``wall`` was entered, the message was written, 
and then ``ctrl+D`` was pressed (which you can’t actually see) 
to terminate wall and send the message to everyone. After 
``ctrl+D`` was pressed, the message was also sent to my 
Terminal window, so the message shows up a second time after a 
Broadcast message that shows it was send from 
user me using the Terminal window ``pts/7``. Pressing enter after 
receiving the message will bring up the command prompt again in the 
Terminal window.

Send a Message to a User's Terminal Window 
******************************************
The ``write`` command gives a user the ability to send a message 
directly to another user’s terminal window on the same computer. 
Before you send a message to a user, you need to decide what 
Terminal window you want to send your message to. For this, you 
should use the ``who`` command. This will allow you to see who 
has a Terminal window open on that computer, along with dates 
and times to see when each Terminal was opened by the user. To send 
a message to one of the Terminal windows you can use the ``write`` 
command. The general syntax is

.. code:: shell

    write user window

For an example, if you want to send a message to a terminal called 
"pts/3" or a user named "theorysuite", I would type 

.. code:: shell

    write theorysuite pts/3

Once you hit enter to execute the command, you can type whatever 
you want as your message. You can press enter and it will continue 
to the next line (not send the message). When you are done typing 
your message and want to send it, press ``ctrl-D`` on the keyboard to 
end the command and send the message.

If the receiver of this message wants to send you a message back, 
they will need to know what Terminal window you are sending from 
so that you will see it on the same Terminal window you are 
writing from.



