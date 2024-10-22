=========================
Moving/Renaming Files
=========================

.. contents::
    :local:

Moving files is an important part of our computational research.
This may be changing the names, moving into new folders, or even 
transferring to another computer. Here are a few commands to do this:

mv - Changing a File Name or Location
**************************************

``mv`` is one of the `Essential Unix Commands <https://csu-theory-suite.github.io/theory-suite-wiki/computing_resources/essential_unix_commands.html>`_, 
so you can find most of the information on that page.
I do want to highlight here that ``mv`` can be used to change the 
location of a file:

.. code:: shell

    mv file.txt new_folder/ 

which move ``file.txt`` from the working directory to a file in 
the folder ``new_folder/`` called ``file.txt``. 

Additionally, you can change the name of a file with ``mv``:

.. code:: shell 

    mv old_file_name.txt new_file_name.txt 

to rename the file to something new. These commands can be used together 
if you want to change the location and the name of a file:

.. code:: shell

    mv old_file.txt new_folder/new_file_name.txt


rename - Changing the Name of Many Files in the Same Way 
********************************************************

``rename`` is a helpful command if you would like to change many file names 
which share a pattern all at once. For example, if you made a typo while 
using ``aqme qprep`` and accidentally have a lot of files that end in 
"optimidation" instead of "optimization", you can change all of the names 
at once with ``rename``:

.. code:: shell

    rename original_pattern new_pattern files 

So for our example above:

.. code:: shell

    rename optimidation optimization *com

to correct the typo in all ``*com`` files. 

cp - Copying a File to a New Location 
**************************************

``cp`` is also an `Essential Unix Command <https://csu-theory-suite.github.io/theory-suite-wiki/computing_resources/essential_unix_commands.html>`_, 
and it works very similarly to ``mv``. The only difference is that ``mv`` 
"removes" the original file, which ``cp`` just makes a new copy with the new 
name/location.

Moving Only Certain Files
***************************

Sometimes, especially when dealing with QM output files,
you might want to only move files which contain a 
certain line of text. For example, all Gaussian output
files for jobs that finished with no problems contain 
the phrase "Normal termination" at the end. Similarly, 
Orca files that finished normally contain the string 
"ORCA TERMINATED NORMALLY".

Sometimes, it would be helpful to move all normal terminations 
into a separate folder for analysis. To do that, you can run
the command:

.. code:: shell

    grep -l "phrase" *files* | while read -r filename; 
    do mv ${filename%.*}* new_folder/; 
    done

This command searches all files for some phrase ("phrase" in 
the example above), then moves all files which have the same 
base as the file into ``new_folder/``. In case you wanted 
to see how to move all Gaussian jobs that have finished into a 
new folder, here is that command:

.. code:: shell

    grep -l 'Normal termination' *log | while read -r filename; 
    do mv ${filename%.*}* finished/; 
    done

This will move the ``.com``, ``.log``, and ``.sh`` files 
(and any others that have the same base name) for 
all jobs which have terminated normally into the folder 
``finished/``, separating the completed jobs from those still 
running or any which have failed.


Copying/Transferring to a New Computer 
***************************************

rsync
+++++

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

scp 
++++

``scp`` functions the same as ``cp``, but stands for "secure copy" and can be used 
to copy files between servers in a secure way. There are many different options 
and examples that can be found `here <https://www.geeksforgeeks.org/scp-command-in-linux-with-examples/>`_.

External Software
++++++++++++++++++

There are some external programs which allow transfers via drag/drop 
directly into folders. This is not recommended for use on HPCs, but 
might be helpful for viewing files without needing to move them in the 
command line.

Mac: Forklift
^^^^^^^^^^^^^

For Mac users, this software is called `Forklift <https://binarynights.com/>`_.
From this interface, you can see Finder views of the files on your computer, 
as well as a different computer that you're logged into with the software. 
There are instructions online for further use, but this tool also 
allows you to preview, for example, Gaussian output files in Gaussview without 
needing to permanently copy them to your computer.

Windows: WinSCP
^^^^^^^^^^^^^^^

For Windows users, this software is called `WinSCP <https://winscp.net/eng/index.php>`_.
From this interface, you can see File Explorer views of the files on your 
computer, as well as a different computer that you're logged into with the 
software. There are instructions online for further use, but this tool also 
allows you to preview, for example, Gaussian output files in Gaussview without 
needing to permanently copy them to your computer.