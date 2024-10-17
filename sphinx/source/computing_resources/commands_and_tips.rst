=========================
Helpful Commands and Tips
=========================

.. contents::
    :local:

Most of the information on this page comes from Dr. Bill Miller III at A. T. Still University.

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

Syncing Changes Between Computing Resources Using Github
********************************************************

Here's a common problem you may run into: you start working on a
cool new idea on a local computing resource. As things start to
fall into place, you copy the directory over to another cluster
resource, and do some work there, perhaps training a model or
running calculations. You end up changing stuff. A week later,
you want to revert those changes... if only you had used some
sort of version control in the first place!

Solution:
This assumes that you are using "main" as the default branch.
If you're using "master", simply substitute it everywhere you
see "main"

1. Set up a git repo from your local computer normally, and push
   your local computer changes to a new github repo.
2. From the HPC machine, run

   .. code:: shell

    git init
    git remote add origin ~~Your new repo's git file~~
    git fetch
    git reset origin/main
    git checkout -t origin/main

   The reset line fixes conflicts with versioned files that
   existed in the directory prior to git init. The last line may
   fail depending on git version - this shouldn't matter for
   current git versions.

3. Commit and push the changes to overwrite the local machine
   files with the HPC files as you choose!



