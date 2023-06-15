=====================================
Welcome to the Theory Suite Wiki Page
=====================================

.. contents::
   :depth: 2

Basic information
-----------------

This repo contains documentation created by members of the 
`@Patonlab <patonlab>`__ and the `@BioE-KimLab <https://github.com/BioE-KimLab>`__
at the Colorado State University. 

The contents are focused in the area of computational chemistry and range from 
example tutorials of calculations to useful resources for new members. 

This repository fulfills three goals: 

*  Serve as a safe space for new members and students to try and get feedback 
   on how to interact with github and how to contribute to code projects. 
*  Facilitate the knowledge transfer between generations of members of the group. 
*  Serve as a practice platform to learn ReStructuredText language and improve
   the members' skills in writing software-related documentation.

Even if you are not a member of either of the research labs, please
feel free to explore our 
`webpage <https://csu-theory-suite.github.io/theory-suite-wiki/>`__ and provide 
feedback on its contents. 

Structure of the repo
---------------------

As you can see the repository contains two main folders, the :code:`docs` folder 
and the :code:`sphinx` folder. The :code:`docs` folder contains all the relevant 
files for hosting the webpage on github-pages, in almost all of the cases you 
will not be editing any of those files manually so you should focus on the 
:code:`sphinx` folder. This one is the root folder of our wiki and we can find 
the :code:`source` folder in it. This second folder contains all the files 
needed for generating the final html files that will end up in the :code:`docs` 
folder. 

Here we have one folder per each one of the main sections of our webpage. Per 
each one of the subsections we will always find at least an .rst file. If it 
requires lots of additional resources or its subsequent subsections are long 
we will find a folder with the same name and within this folder we will find the
appropriate contents, be it a folder with all the image files, or all the 
subsequent subsections .rst files.


How to contribute to the wiki
-----------------------------

Although we are planning on including a more detailed explanation in the near 
future directly here is a very short walkthrough for making changes in the 
webpage. 

1. Fork the repository
......................

On the top-right of the repository page you should be able to see a "fork" button
this allows you to create a clone of the current repository in your own github 
account. 

2. Clone your github's fork on your computer
............................................

Open the repository page of the fork you just created, go to the "<> Code" 
button and copy your preferred URL. 

Then open a terminal and navigate to the folder where 
you will be getting a local copy of the repository. We will assume that the 
Documents/csu-theory-suite is where we want our local copy.

.. code:: shell 

   cd Documents
   git clone https://github.com/CSU-Theory-Suite/theory-suite-wiki.git theory-suite-wiki

3. Ensure that your environment is adequate
...........................................

Although we do not need many special tools for building our environment
we do need to make sure that we have the basic tools: 

*  sphinx
*  sphinx-rtd-theme
*  nbsphinx (Required until new notice)

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

4. Generate a local pre-view of the files
.........................................

We can generate a local pre-view of the html files with the following commands: 

.. code:: 

   cd ~/Documents/csu-theory-suite/sphinx
   make clean # not always required, but will make sure that all changes are reflected
   make html

This will create a new folder with the name :code:`_build` within the sphinx folder.
Within this folder we have the :code:`html` folder that contains the :code:`index.html`
A simple way of pre-visualizing the documentation is to drag and drop this file 
to our web browser and navigate to the section we had edited. 


5. Do the modifications in the rst files
........................................

Using our preferred text editor we will do the changes and save those files. After 
a set of related changes we will "locally save them" in our git repository. As 
example lets assume we made changes in one file of graphical_software and another 
of helpful_packages. 

.. code:: shell

   cd ~/Documents/csu-theory-suite/sphinx
   git status # Check that all the files in red are the ones that you have changed
   git add source
   git status # Check that all the files now appear in green 
   git commit -m 'Descriptive short message summarizing the changes'


.. note:: 

   Remember to re-generate the local pre-view and visualize the changes to ensure
   that they show properly. 

6. Pushing the results to your github fork
..........................................

Now that we have changed the source files we want to have them not only on our 
local computer but also on our personal github.  To do so we just need to run: 

.. code:: shell

   git push origin master

7. Rebuilding the Docs
......................

After various iterations of steps 4,5 and 6 you will arrive to a point where your
changes are ready for other people to see them. After we make sure that all changes 
to the files in source are properly commited and saved we proceed to re-building 
the documentation and updating all files in the docs/ folder. For convenience we 
have a custom command to do that in our makefiles: 

.. code:: shell 

   cd ~/Documents/theory-suite-wiki/sphinx
   make github

Now we proceed to commit the changes and push them to our repo

.. code:: shell

   cd ~/Documents/theory-suite-wiki/
   git status        # Always check
   git add docs
   git status        # Always check
   git commit -m 'Rebuilt the Docs'

Just so that it is easier to skim through the commits we will use this message 
so that whoever is checking the changes knows that only files in the docs folder
were changed and that it was in an automatic manner. This practice is not 
necessarily an standard, but it is widely used (and in the future we will have a
workflow doing this last step for us, so might as well get used to seeing this 
message) 

Finally we push the changes to our github fork

.. code:: shell

   git push origin master 

8. Creating a pull request
..........................

Now we proceed to the create a pull request. We go to the repository page of our 
fork, click on the "Pull requests" tab and then on the green button 
"New pull request"

Now we make sure that the base repository is the CSU-Theory-Suite (on the left) 
and that the head repository is ours (on the right) and click the 
"Create pull request"

Finally we write a short message as title and a description of the changes we 
made. This is likely going to be read by whoever is acting as admin of the repo. 
They might provide feedback on the changes (specially if you do not ask them to 
merge it 5 minutes before the web needs to be active for, lets say, a presentation)

.. note:: 

   Usually github should notify them if they have it properly set up, but it is 
   not a bad idea to send them a message or drop by their desk and tell them that 
   you created a pull request. 

After writing the message, click on "Create pull request". 
Now its the admins problem!

.. note:: 

   Even if the merge is accepted on the spot, it will still have a short delay 
   for the changes to be reflected in the actual webpage. Usually you can keep 
   track of it by checking a yellow/green dot that will appear in the last commit 
   of the CSU-Theory-Suite repo. 

   