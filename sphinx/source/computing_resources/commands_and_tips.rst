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



