=======================
Essential Unix Commands 
=======================

.. contents::
    :local:

This page serves as a unix manual to help users get to know unix
commands and allow for more efficient research in the command line.

Most of the information on this page comes from Dr. Bill Miller III at A. T. Still University.

Here are some of the most important/frequently used commands.
These are the basics to using linux machines and working on the command line.

.. table:: Essential Linux Commands

  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | Command             | Option         | What it Does                                          | Example                   |
  +=====================+================+=======================================================+===========================+
  | cd                  |                || Changes the working directory to the home            | ``cd``                    |
  |                     |                || directory (a folder named your net ID).              |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  |                     | ``..``         || Changes the working directory to the folder          | ``cd ..``                 |
  |                     |                || containing the current working directory.            |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  |                     | ``[directory]``|| Changes your working directory to the one            | ``cd my_project``         |
  |                     |                || you specify.                                         |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | exit                |                || Exits the current working network point.             | ``exit``                  |
  |                     |                || If I am logged into a node on ACME, typing           |                           |
  |                     |                || ``exit`` will move my working location to            |                           |
  |                     |                || the head node on ACME.                               |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | ssh [cluster name]  |                || Moves working location to another computer           | ``ssh acme``              |
  |                     |                || in the network.                                      |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | rlogin [node name]  |                || Moves to a node in a cluster on the network.         | ``rlogin node01``         |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | pwd                 |                || Returns the current working directory.               | ``pwd``                   |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | ls                  |                || Lists all the folders and files in the               | ``ls``                    |
  |                     |                || working directory.                                   |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | cp [file] [location]|                || Copies ``file1`` and makes a duplicate in the        || ``cp file.com copy.txt`` |
  |                     |                || same working directory that is called ``location``   || OR                       |
  |                     |                || **OR** makes a copy of ``file1`` in the different    || ``cp file.com pre_run/`` |
  |                     |                || specified directory called ``location/``.            |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  |                     | ``-r``         || Same as the previous, but allows the copying         | ``cp -r folder1 folder2/``|
  |                     |                || of folders (including their contents) too.           |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | scp [file] [cluster]|                || Copies files to another computer in the network.     | ``scp file.com acme``     |
  |                     |                || The ``-r`` option works for secure copy too.         |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | mv [item] [location]|                || Moves a file (or folder if using the ``-r``          || ``mv file.com jobs/``    |
  |                     |                || option) to the specified location. This is           || OR                       |
  |                     |                || used to rename files as well.                        || ``mv file.com file2.com``|
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | rm [file]           |                || Deletes a file.                                      | ``rm file.com``           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  |                     | ``-r``         || Deletes a folder.                                    | ``rm -r my_jobs/``        |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | mkdir [folder name] |                || Makes a folder.                                      | ``mkir my_jobs/``         |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | rmdir [folder name] |                || Deletes an EMPTY folder.                             | ``rmdir my_jobs/``        |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | less [file name]    |                || Opens a file for viewing only. Once viewing          | ``less file.com``         |
  |                     |                || the file,``shift+g`` will take you to the bottom     |                           |
  |                     |                || of the document (``g`` alone will take you to the    |                           |
  |                     |                || top). Typing ``?[text]`` will search the document    |                           |
  |                     |                || for instances of '[text]' above the current cursor   |                           |
  |                     |                || location. ``q`` quits.                               |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | vi [file name]      |                || Opens a file for viewing or editing. Files start in  | ``vi file.com``           |
  |                     |                || viewing mode. While in viewing mode, typing ``dd``   |                           |
  |                     |                || will delete the line on which the cursor resides.    |                           |
  |                     |                || To enter insert mode, type ``i``. Once in insert     |                           |
  |                     |                || mode, you can make changes to the text. To exit      |                           |
  |                     |                || insert mode, hit the ``esc`` key. To save and quit,  |                           |
  |                     |                || type ``:wq`` then hit ``enter`` (while not in insert |                           |
  |                     |                || mode). To quit without saving, type ``:q!``, then    |                           |
  |                     |                || hit ``enter``.                                       |                           |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+
  | cat [file name]     |                || Prints the contents of a file to the Terminal window.| ``cat file.com``          |
  +---------------------+----------------+-------------------------------------------------------+---------------------------+


 







