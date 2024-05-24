=====================================
Welcome to the Theory Suite Wiki Page
=====================================

.. contents::
   :depth: 2

Basic information
-----------------

This repo contains documentation created by members of the 
`@Patonlab <https://github.com/patonlab>`__ and the 
`@BioE-KimLab <https://github.com/BioE-KimLab>`__
at the Colorado State University. 

The contents are focused in the area of computational chemistry and range from 
example tutorials of calculations to useful resources for new or existing members. 

This repository fulfills three goals: 

*  Serve as a safe space for new members and students to get feedback 
   on how to interact with GitHub and how to contribute to code projects. 
*  Facilitate the knowledge transfer between generations of members of the group. 
*  Serve as a practice platform to learn ReStructuredText language and improve
   the members' skills in writing software-related documentation.

Even if you are not a member of either of the research labs, please
feel free to explore our 
`webpage <https://csu-theory-suite.github.io/theory-suite-wiki/>`__ and provide 
feedback on its contents. 

Structure of the repo
---------------------

As you can see, the repository contains two main folders, the :code:`docs` folder 
and the :code:`sphinx` folder. The :code:`docs` folder contains all the relevant 
files for hosting the webpage on github-pages, in almost all of the cases you 
will not be editing any of those files manually so you should focus on the 
:code:`sphinx` folder. This is the root folder of our wiki and we can find 
the :code:`source` folder in it. This second folder contains all the files 
needed for generating the final html files that will end up in the :code:`docs` 
folder. 

Here we have one folder for each one of the main sections of our webpage. Per 
each one of the subsections we will always find at least one .rst file. If it 
requires lots of additional resources or its subsequent subsections are long, 
we will find a folder with the same name and within this folder we will find the
appropriate contents, be it a folder with all the image files, or all the 
subsequent subsections' .rst files.


How to contribute to the wiki
-----------------------------

Here is a short walkthrough for making changes to the 
webpage, such as correcting typos or adding tutorials. 
There is a slightly more detailed version of these
same instructions within the wiki website.

1. Fork the repository
......................

On the top-right of the repository page you should be able to see a "Fork" button (between "Watch" and "Star").
This button allows you to create a clone of the current repository in your own GitHub 
account. This is now your own repository and you can make and implement changes as you see fit without
editing the primary page (owned by CSU-Theory-Suite).

Rather that appearing as :code:`CSU-Theory-Suite/theory-suite-wiki`, your fork of this repository will be shown
as :code:`YOUR-GITHUB-USERNAME/theory-suite-wiki` (or something else if you changed the name).

2. Clone your github's fork on your computer
............................................

Cloning this repository on your own computer will allow you to make edits
more easily using programs such as Visual Studio Code, or even just the terminal.
However, it is important to ensure that the clone on your computer is updated
the same as your forked repository on the GitHub website, and possibly that your
online fork is updated to the primary repository owned by CSU-Theory-Suite.

To clone your fork onto your computer, open the repository page of the fork you 
just created, go to the green "<> Code" button at the top right, and copy your preferred URL. 

Then, open a terminal and navigate to the folder where 
you will be getting a local copy of the repository. We will assume that the 
:code:`Documents/theory-suite-wiki` is where we want our local copy.

.. code:: shell 

   cd Documents
   git clone https://github.com/CSU-Theory-Suite/theory-suite-wiki.git theory-suite-wiki

3. Ensure that your environment is adequate
...........................................

Although we do not need many special tools for building our environment,
we do need to make sure that we have the basic necessary tools: 

*  sphinx
*  sphinx-rtd-theme
*  nbsphinx (Required until further notice)

We can install them easily using pip

.. code:: shell

   python -m pip install sphinx sphinx-rtd-theme nbsphinx

.. warning:: 

   Make sure that the spelling is correct, the number of times I have tried to 
   install sphinx-rdt-theme and got annoyed at it being unable to find the 
   package have been more than what I would like to acknowledge.

.. note:: 

   Using :code:`python -m pip` instead of directly using :code:`pip` will make 
   sure that we are installing the packages in the specific python interpreter 
   that we are calling with the python command. If we are in a virtual environment
   it will be the python interpreter of the virtual environment, independently of 
   it being a conda environment, a python venv or any other kind of virtual 
   environment (or no virtual environment whatsoever).

4. Generate a local preview of the files
.........................................

We can generate a local preview of the html files (the website page we are creating) with the following commands: 

.. code:: shell

   cd ~/Documents/csu-theory-suite/sphinx
   make clean # not always required, but will make sure that all changes are reflected
   make html

This will create a new folder with the name :code:`_build` within the sphinx folder.
Within this folder we have the :code:`html` folder that contains the :code:`index.html`
A simple way of pre-visualizing the documentation is to drag and drop this file 
to our web browser and navigate to the section we had edited. 


5. Make the modifications in the rst files
...........................................

Using our preferred text editor, we will make the wanted changes and save those files. 
For more details on how to edit the rst files, check within the wiki website. After 
a set of related changes we will "locally save them" in our git repository. As an
example, let's assume we made changes in one file of graphical_software and another 
of helpful_packages. 

.. code:: shell

   cd ~/Documents/csu-theory-suite/sphinx
   git status # Check that all the files in red are the ones that you have changed
   git add source
   git status # Check that all the files now appear in green 
   git commit -m 'Descriptive short message summarizing the changes'


.. note:: 

   Remember to re-generate the local preview and visualize the changes to ensure
   that they show properly and double check for typos. 

6. Pushing the results to your personal GitHub fork
....................................................

Now that we have changed the source files, we want to have them not only on our 
local computer but also on our personal GitHub.  To do so we just need to run: 

.. code:: shell

   git push origin master


This command will sync the online version of your fork with the version you have
made edits to on your computer. Similarly, if you are trying to sync the version 
on your computer to match that which is online, the command is:

.. code:: shell

   git pull origin master


7. Creating a pull request
..........................

Now we proceed to create a pull request. We go to the repository page of our 
personal fork, click on the "Pull requests" tab (at the top left of the page) and then on the green button 
"New pull request" at the top right of the page.

Now we make sure that the base repository is the CSU-Theory-Suite/theory-suite-wiki (on the left) 
and that the head repository is ours (on the right) and click the 
"Create pull request"

Finally, we write a short message as title and description of the changes we 
made. This is likely going to be read by whoever is acting as admin of the repo before adding
your changes to the primary webpage. 
They might provide feedback on the changes (especially if you do not ask them to 
merge it 5 minutes before the web needs to be active for, lets say, a presentation)

.. note::

   The current admins of this page are Alex (Paton group), Hojin (Kim group), and Raul (Kim group).
   Feel free to ask about becoming an admin yourself if you're interested!


.. note:: 

   Usually GitHub should notify them if they have it properly set up, but it is 
   not a bad idea to send them a message or drop by their desk and tell them that 
   you created a pull request. 

After writing the message, click on "Create pull request". 
Now its the admins' problem!

.. note:: 

   Even if the merge is accepted on the spot, it will still have a short delay 
   for the changes to be reflected in the actual webpage. Usually you can keep 
   track of it by checking a yellow/green dot that will appear in the last commit 
   of the CSU-Theory-Suite repo. Once you see the green checkmark, everything 
   should be good to go.

   
