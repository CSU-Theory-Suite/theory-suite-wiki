==================
File System Layout
==================

.. contents::
    :local:

Most of the information on this page comes from Dr. Bill Miller III at A. T. Still University.

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