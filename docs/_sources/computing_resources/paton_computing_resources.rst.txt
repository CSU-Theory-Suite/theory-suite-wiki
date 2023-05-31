=============================
Paton Lab Computing Resources
=============================

.. contents::
   :local:

Here is an overall list of computing resources available to students in the Paton lab

But first, here are some tips for accessing these computers:

*  ssh is a fundamental command used to virtually log into a system
*  $USER in all these example commands should be replaced with your username on these computers
*  You will need to create accounts on all of these computers to gain access
*  I recommend setting up aliases in your ~/.bashrc or ~/.bash_profile or ~/.zshrc
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

You should also get in contact with an ACCESS admin in the group (Mihai and Graham 
as of June 2023) to be added to the allocations group for the lab.

Alpine
------

As CSU students, we have access to a shared cluster **Alpine** with CU Boulder 
(hosted in Boulder, CO).

In order to gain access to Alpine follow 
`this link <https://it.colostate.edu/research-computing-and-cyberinfrastructure/compute/get-started-with-summit/>`__
Each time you log onto Alpine, you will need to run the command 
``module load slurm/alpine``. More information can be found 
`here <https://curc.readthedocs.io/en/latest/clusters/alpine/quick-start.html>`__.

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
is Abhijeet (June 2023).

Local Resources
---------------

The Paton lab also has a number of **local machines** available to students to 
use. These machines do not have a queueing system like many other 
computers do, but are useful for different tasks you may have. 

Here are aliases to the local CSU resources:

.. code:: shell

    alias drmax='ssh $USER@drmaximus.chem.colostate.edu'
    alias subzero='ssh $USER@subzero.chem.colostate.edu'
    alias fireball='ssh $USER@fireball.chem.colostate.edu'
    alias dynamo='ssh $USER@dynamo.chem.colostate.edu'
    alias buzzsaw='ssh $USER@buzzsaw.chem.colostate.edu'

To get accounts on these computers, you will need to contact an admin. For the 
Paton lab, this is Abhijeet (June 2023).

Here is the CPU information for ACME and the local machines:

.. code:: shell

    acme.chem.colostate.edu acme (16 x 32 cpus)
    dynamo.chem.colostate.edu dynamo (2 x 24 cpus)
    buzzsaw.chem.colostate.edu buzzsaw (2 x 24 cpus)
    fireball.chem.colostate.edu fireball (2 x 24 cpus)
    subzero.chem.colostate.edu subzero (2 x 24 cpus)
    drmaximus.chem.colostate.edu drmaximus (2 x 12 cpus)