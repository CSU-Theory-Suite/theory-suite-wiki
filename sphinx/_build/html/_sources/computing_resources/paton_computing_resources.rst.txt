=============================
Paton Lab Computing Resources
=============================

.. contents::
   :local:

Here is an overall list of computing resources available to students in the Paton lab

But first, here are some tips for accessing these computers:

*  ``ssh`` is a fundamental command used to virtually log into a system
*  ``$USER`` in all these example commands should be replaced with your username on these computers
*  You will need to create accounts on all of these computers to gain access
*  I recommend setting up aliases in your ``~/.bashrc`` or ``~/.bash_profile`` or ``~/.zshrc``
    *  Aliases can be used as short cuts for bash commands
    *  Using aliases to log into different computers can save time and confusion

Expanse and Bridges2
--------------------

We typically apply for an ACCESS grant each year to get compute time on the
**Expanse** and **Bridges2** clusters.

The following aliases will allow you to type ``expanse`` or ``bridges2`` into
your terminal and immediately ssh to that computer.

.. code:: shell

    alias expanse='ssh $USER@login.expanse.sdsc.edu'
    alias bridges2='ssh $USER@bridges2.psc.edu'

.. note::

    You will still have to type in a password, but this will allow you to avoid
    typing the long hostname each time you want to access another computer.

Before you can access either of these computers, you will have to create accounts
for both expanse and bridges2, as well as ACCESS in order to use the resources.

.. note::

   Make sure you know your username on each of these computers, as it may be
   different than what you normally use depending on how the account is created.

You can follow these websites to make accounts on
`Expanse <https://www.sdsc.edu/index.html>`__,
`Bridges2 <https://www.psc.edu/>`__, and
`ACCESS <https://access-ci.org/>`__.

Additionally, you will need to fill out
`this form <https://www.psc.edu/resources/software/gaussian/>`__ to gain access
to Gaussian, or email them for help.

You should also get in contact with an ACCESS admin in the group (Mihai, Graham & Abhijeet
as of June 2023) to be added to the allocations group for the lab.

Alpine
------

As CSU students, we have access to a shared cluster **Alpine** with CU Boulder
(hosted in Boulder, CO).

In order to gain access to Alpine follow
`this link <https://www.colorado.edu/rc/alpine>`__
Each time you log onto Alpine, you will need to run the command
``module load slurm/alpine``. More information can be found
`here <https://curc.readthedocs.io/en/latest/clusters/alpine/quick-start.html>`__.

.. note::

    We have access to Alpine as CSU students, not through an ACCESS allocation. Because of this,
    make sure that you are logging in with your CSU information, not your ACCESS information.

The alias to log in to Alpine is:

.. code:: shell

    alias alpine='ssh $USER@colostate.edu@login.rc.colorado.edu'

You will be required to log in using your CSU NetID information
(username and password), as well as sign in with Duo.
There are two ways to sign in with Duo to this computer: type
``your_password`` then enter in the 6-digit pin on the Duo app, or type
``your_password,push`` which will send a Duo push notification to your phone.

.. note::

   Let's say that for illustrative purposes that your password is ``123456`` and
   that you want a Duo push. Then you will type ``123456,push``.

Before you can use Gaussian on Alpine, you will need to email
``rc-help@colorado.edu`` to be added to ``rpatongrp@colostate.edu``
(just send them your username).

You should also add the following to your ~/.bashrc or ~/.bash_profile or
~/.zshrc on Alpine for additional group-specific messages:

.. code:: shell

    # Get group aliases and functions
    export RSP=rpaton@colostate.edu
    export PROJECTS=/projects/$RSP
    if [ -d $PROJECTS/bin ] ; then
        PATH=$PATH:$PROJECTS/bin
        export PATH
    fi
    if [ -f $PROJECTS/bin/.bashrc ]; then
        source $PROJECTS/bin/.bashrc
    fi

ACME
----

**ACME** is a shared computer between the Paton and Kim labs. This computer has
a queueing system (SLURM) to allow for easy use for all students of the Theory
Suite. There are also a number of premade submission scripts on ACME that are
available to help with running jobs.

Here is the alias for ACME:

.. code:: shell

    alias acme='ssh $USER@acme.chem.colostate.edu'

To gain access to ACME, contact an admin to make an account. The current admin
for the Paton group is Abhijeet, and from the Kim group you can go to Sabari, or Collin (October 2024).

There are sample input files for many of the software that we use on ACME. If you would 
like to see example calculation input files, you can copy the folder 
``/opt/apps/example_jobs/`` into your home directory to see the format of different input files. 
Currently there are examples for CREST, Gaussian, MILO, QChem, ORCA, NCI, and xTB.

Local Resources
---------------

The Paton lab also has a number of **local machines** available to students to
use. These machines do not have a queueing system like ACME of the HPCs, 
but are useful for different tasks you may have.

Here are aliases to the local CSU resources:

.. code:: shell

    alias subzero='ssh $USER@subzero.chem.colostate.edu'
    alias fireball='ssh $USER@fireball.chem.colostate.edu'
    alias dynamo='ssh $USER@dynamo.chem.colostate.edu'
    alias buzzsaw='ssh $USER@buzzsaw.chem.colostate.edu'
    alias skymarshal='ssh $USER@skymarshal.chem.colostate.edu'
    alias drstrange='ssh $USER@drstrange.chem.colostate.edu'

To get accounts on these computers, you will need to contact an admin. For the
Paton lab, this is Abhijeet or Alex (October 2024).

Here is the CPU information for ACME and the local linux machines:

.. code:: shell

    acme.chem.colostate.edu acme (20 x 32 cpus)
    dynamo.chem.colostate.edu dynamo (2 x 24 cpus)
    buzzsaw.chem.colostate.edu buzzsaw (2 x 24 cpus)
    fireball.chem.colostate.edu fireball (2 x 24 cpus)
    subzero.chem.colostate.edu subzero (2 x 24 cpus)
    skymarshal.chem.colostate.edu skymarshal (1 x AMD Ryzen Threadripper PRO 7985WX 64-Cores)
    drstrange.chem.colostate.edu drstrange (2 x NVIDIA RTX A6000 GPUs | AMD Ryzen Threadripper PRO 5975WX 32-Cores)

On the linux machines, it may also be helpful to test to see what
software is correctly installed/called. To check this make sure that
this line is included in your ``.bashrc``:

.. code:: shell

    export PATH=$PATH:/usr/local/patonlab/python:/usr/local/patonlab/autotest

then create an empty folder (probably called autotest), go into the
folder, and type the command

.. code:: shell

    AUTOTEST

Running this command goes through several useful packages that are
installed on these machines and submits a quick test job to ensure
that they are working. If everything is working and set up correctly,
you should get a result that looks something like:

.. code:: shell

    !  Gaussian 16 is working properly
    !  NBO7 is working properly
    !  Orca is working properly in serial
    !  Orca is working properly in parallel
    !  QChem is working properly
    normal termination of xtb
    !  XTB is working properly
    !  CREST is working properly
    !  NCIPLOT is working properly
    !  COSMOTHERM is working properly
    ridft ended normally
    !  TURBOMOLE is working properly in parallel


If you get an error for one of the packages, it is most likely a
problem with the path set for that program in your ``.bashrc``, and
you should correct/add the path and run ``AUTOTEST`` again.

When you are finished testing the programs, you can delete the files
with the command

.. code:: shell

    AUTOTEST_CLEAN


RStor File Storage
------------------

The Paton group also has a file backup system called RStor.
This storage is a good way to put files for any completed 
projects, as well as any large datasets that you may have 
created or are using. Here are instructions for how to access 
this drive and add files.

.. warning::
    
    This is a private drive only for students in 
    the Paton group at CSU. For this reason, you will need to 
    email IT Support (Ross Madden) and cc Rob
    so that they can invite you to the drive.
    Until then, you will be unable to access the drive.

How you set up the drive on your personal computer might be 
different based on if you have a Mac or a PC. I will include instructions 
for both here to be followed **after** you have been added as a user.

.. warning:: 
    
    In order to access this drive, you have to be on campus or using the VPN. 
    


Mac Instructions
++++++++++++++++

To access the drive on your Mac, you have two options. First, 
you can directly click this link: 
`smb://campusrstor1.onefs.colostate.edu/natsci/patonlab <smb://campusrstor1.onefs.colostate.edu/natsci/patonlab>`__

Otherwise, you can click on your desktop/background, then at the top 
of your screen click **Go** then **Connect to Server...** in the pull-down 
menu. This will take you to a finder page titled "Connect to Server". 
Type in ``smb://campusrstor1.onefs.colostate.edu/natsci/patonlab`` in the 
space and hit **Connect**. This will now prompt you to log in using your 
CSU login information, possibly preceeding your username with ``COLOSTATE\``.

.. warning:: 

    Make sure that this login information matches how you log into RamWeb. 
    The username for this drive will be your CSU username, regardless of 
    what your username on your laptop is. If your CSU username is ``CamRam`` 
    but your laptop knows you as ``CoolCam``, you will need to update the 
    username field to read ``CamRam`` or ``COLOSTATE\CamRam``. 

Once you've logged in, you should be in a Finder window called ``patonlab``. This is 
the RStor drive, you're in! From here, you can also open a terminal window to this 
folder directly from the Finder window, and you'll be able to use the drive to store 
your files. Otherwise, you can type ``cd /Volumes/patonlab/`` in any terminal window 
to access the RStor drive.

PC Instructions
+++++++++++++++

The first step to accessing the drive on a Windows computer is opening the 
File Explorer and going to **This PC**. If your computer is Windows 10, 
click **Map Network Drive** while in the **File** tab. If your computer is 
Windows 11, click the three dots on the top right ribbon (under the 
search bar), then click **Map Network Drive**.

Once on this page, choose an empty drive (probably **T:** or **Z:**). in 
the **Folder** box, type ``\\campusrstor1.onefs.colostate.edu\natsci\patonlab``. 
Now, a popup window should appear asking for your login information. You will 
log in with your CSU information, the CSU net ID preceeded by ``COLOSTATE\`` 
and your password like you would use for RamWeb or email.

.. note::

    Your username for this is going to be ``COLOSTATE\your_csu_netID`` 
    and the password is your normal CSU password

.. warning::
    
    You may need to alter auto-fill settings here to ensure that the 
    login information is correct. For example, if your computer knows 
    you as ``CoolCam``, it might try to fill that in automatically 
    instead of your CSU net ID ``CamRam``.
    Make sure that you change this to the correct information.

Once you've logged in this way, you should be all set to use and 
access all of the files in the drive. If you run into any issues 
setting it up, just follow `this link <https://cnsit.colostate.edu/kb/mapping-a-network-drive/>`__ 
for instructions, or email IT Support (Ross Madden).

Transferring Files to RStor
+++++++++++++++++++++++++++

.. note:: 
    
    Once you are logged in, you should see two folders, "Completed_projects" 
    and "Users"
    
There are a few ways to transfer files into this backup drive. The first is to 
just drag-and-drop files using the Finder or File Explorer windows. The next is 
to transfer files using the terminal. My preference is ``rsync``, so I will go 
over how to transfer files to the drive this way. You can also you ``scp``.

Moving files into this drive works the same as any ``rsync`` command, where 
you specify which files you're moving and where you plan to move them to.
I recommend that you always pull the files from any other computer/HPC to 
you while you are in the RStor drive on the terminal. For this, you will use:

.. code:: shell

    rsync -azvp --progress '<USERNAME>@<COMPUTER>:/location/of/files/to/store' .

.. warning::

    Some of the computers or HPCs have unexpected hostnames, or ``<COMPUTER>`` 
    in my above example. You want to include the hostname you use when you 
    ``ssh`` into the computer, not the output when you run  the 
    ``hostname`` command. For example, **Alpine** is ``login.rc.colorado.edu``, 
    not ``loginXX``. Also, make sure that ``<USERNAME>`` is what you use to 
    login to the computer, so for Alpine your username is ``Your-CSU-ID@colostate.edu`` 
    instead of just ``Your-CSU-ID``.

From here, type in your password for the computer you are moving files from (Alpine in 
my example) to start moving files. 
This command takes files from a specified folder (``/location/of/files/to/store``) and 
transfers them to the current working directory (``.``), so make sure the 
current working directory is where you want the files to go before running this command.


