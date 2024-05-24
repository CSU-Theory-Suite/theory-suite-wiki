========================
Adding Pages to the Wiki
========================

.. contents::
    :local:

If you have expertise that you want to share with the 
rest of the Theory Suite, adding a page to the wiki 
(or editing an existing page) is a great way to do that 
and help your fellow lab mates! This page will go through 
the basics of adding to the wiki and how to read/write 
ReStructuredText, the format of all the pages. A lot of 
this information also exists in the README on the 
`GitHub Page <https://github.com/CSU-Theory-Suite/theory-suite-wiki>`_, 
but this will go into a little more detail.

1. Fork the Repository
----------------------

At the top-right of the repository page, you should be able to 
see a ``Fork`` button (between ``Watch`` and ``Star``). This button 
allows you to create a clone of the current repository to 
your personal GitHub account. Once you fork the repo, it is now
yours, so you can make and implement changes as you see fit 
without changing the original page owned by CSU-Theory-Suite.

Rather than appearing as ``CSU-Theory-Suite/theory-suite-wiki``,
your fork of this repository will be shown as 
``YOUR-GITHUB-USERNAME/theory-suite-wiki``, or something else
if you changed the name when you forked the repo.

2. Clone Your Fork to Your Computer
-----------------------------------

Cloning this repository from your online account onto your personal 
computer will allow you to make edits/changes more easily. You can 
make these edits in programs such as 
`Visual Studio Code <https://code.visualstudio.com/>`_, or even 
just in the terminal.

One thing to note, it is important that the clone on your computer 
is updated to be the same as your fork of the repository on the 
GitHub website. I would also make sure that your online fork is 
updated to the same version as the primary repository owned by 
CSU-Theory-Suite (the only exception would be if you are actively
making changes and don't want to change your current version).

To clone your fork onto your computer, open the repository page of 
your fork (``YOUR-GITHUB-USERNAME/theory-suite-wiki``), go to the 
green ``<> Code`` button at the top right, and copy your preferred 
URL.

Once this is copied, open a terminal and navigate to the folder where 
you will be putting your local copy of the repository. For now, we 
will assume that place is ``Documents/theory-suite-wiki/``.

Use the following line of code to complete the cloning:

.. code:: shell

    cd Documents/
    git clone https://github.com/CSU-Theory-Suite/theory-suite-wiki.git theory-suite-wiki

.. note:: 

    The URL in the example above copies the main branch to your computer. 
    Ensure that this is the URL that you copied from *YOUR* fork of 
    the repository.

If you already have the repository cloned to your computer and 
just want to update the version with what you have online, you 
don't have to re-clone, instead just pull the files to you:

.. code:: shell

    cd ~/Documents/theory-suite-wiki/
    git pull origin master


This code will take files in the master branch of the online 
repository and pull them onto your computer.

3. Ensure Your Environment is Adequate
--------------------------------------

Though we don't need many tools to build our environment, we do want 
to make sure that we have the basic necessities to edit the 
webpage:

* sphinx
* sphinx-rtd-theme
* nbsphinx (Required until further notice)

We can install all these packages using ``pip``

.. code:: shell

    python -m pip install sphinx sphinx-rtd-theme nbsphinx

.. warning:: 

    Make sure that the spelling of the packages is correct.
    The number of times that I have tried to install 
    ``sphinx-rdt-theme`` and been annoyed at it not finding
    the package is more than I care to admit...

.. note:: 

    Using ``python -m pip`` instead of directly using ``pip`` will 
    make sure that we are installing the packages in the specific 
    python interpreter that we are calling with the ``python`` 
    command. If we are in a virtual environment, it will be the python 
    interpreter of the virtual environment, independently of it being 
    a conda environemnt, a python venv, or any other kind of virtual 
    environment (or no virtual environment whatsoever).

4. Generate a Local Preview of Existing Files
---------------------------------------------

We are able to generate a local preview of the html files
(the webpage that we are creating) with the following 
commands:

.. code:: shell

    cd ~/Documents/theory-suite-wiki/sphinx
    make clean #this is not always needed, but will make sure all changes are reflected
    make html

This will create a new folder in ``~/Documents/theory-suite-wiki/sphinx/`` 
called ``_build``. In this folder, there is the ``html/`` folder containing 
a file called ``index.html``. A simple way to visualize the documentation and 
ensure that the changes you made are to your liking is to drag and drop 
this ``index.html`` file into your web browser, then navigate to the section 
you have just edited. This is a great way to see how your page will look 
when added to the website and make sure that everything links correctly 
and looks nice before commiting your changes.

5. Make Modifications in RST Files
----------------------------------

5.1 Making Sure Your Page is Started Correctly
++++++++++++++++++++++++++++++++++++++++++++++

A conveinent feature of this website is that everything 
links to the page you want and there are sections 
to help make searching easier for the readers. To 
make sure that your page is easy to find, there are a 
few things you need to do.

First, decide what section you want to add your page to.
If there isn't an obvious section, you can also add 
one to make sure that the wiki stays organized. You can 
look at existing sections either on the current wiki or 
in the file in ``~/Documents/theory-suite-wiki/sphinx/index.rst``.
This file contains the structure of the website, and you 
will need to update it when you add new pages.

To add a page, go into the ``index.rst`` file and scroll to 
the section that you want to add your page to. Each section 
is designated by a ``.. toctree::`` with the caption corresponding 
to the title of the page. Find your section, then add the 
appropriate file path in that section. 

.. note:: 

    If you are adding to an existing section, there should 
    already be a folder created in the ``source/`` folder for 
    that section. If you are creating a new section, you will 
    want to also create a new folder in the ``source/`` folder.
    For example, everything in the **Graphical Software**
    section is included in the ``graphical_software/`` folder.

Once you have found your section and designated the RST file 
that will house your new page, go ahead and create the file.
With the RST file made for the page, and that file linked in 
the ``index.rst`` file, you can start building your page on the 
website!

.. note::

    If you want to add outside resources/files to your page, you can 
    make new folders within your page's folder to keep all 
    additional files to make your page of the wiki nice.

5.2 Modifying RST Files
+++++++++++++++++++++++

ReStructuredText (RST) isn't necessarily a file format you might be 
familiar with. It's similar to Markdown, essentially a way to 
format text files using commands rather than a toolbar like 
Word. Nearly all files that make up this wiki are written in RST, so
it's important to be able to read/write these types of files if 
you're going to make helpful changes to the wiki.

First, I'm going to go over the basics of RST and how to 
write common formats. For more information (or if you 
forget a command), you can go `here <https://docutils.sourceforge.io/docs/user/rst/quickref.html>`_ 
for a list of RST commands (or Google questions as they come to you).
Additionally, if you notice that another page of the wiki 
has formatting that you like, you can open the source code for 
that page and see what they did to achieve that formatting.

Titles and Headings
*******************

Each new page you make should have a title. RST has features 
similar to Word where you can include a title and different 
levels of (sub)headings. You make these formatting changes 
with different uses of punctuation:

* equal sign (=)
* period (.)
* dash (-)
* asterisk (*)
* pound (#)
* carrot (^)
* plus (+)

There is a general rule of thumb for which symbol to use when 
(go to `this page <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_ 
for more information), but as long as you're consistent with what 
you use it will work.

Below is an example of what titles/headings/subheadings might 
look like when you're making a page for the website:

.. highlight:: none

.. literalinclude:: examples/titles_headings.txt

.. highlight:: default

.. note::

    You can use any style of punctuation to designate 
    headings/subheadings, but once you have picked an 
    order you must stick to it. In the example above, 
    ``+`` represents the sub-subheading, and that will 
    still be the case if there are no headings before 
    it. Similarly, ``*`` is the character that designates 
    the headings, nothing else will behave that way now.

.. note::

    The punctuation must at least be enough to "underline"
    all of the text of the title/heading. It can be longer
    (like for "Title" in the example), but it cannot be 
    fewer characters than used in the heading.

Notes, Warnings, and Tips
*************************

Addings notes, warnings, and/or tips to your page can be 
a helpful way of stressing important points to your readers. 
These features are easy to add to your page with the 
following formats:

.. highlight:: none

.. literalinclude:: examples/tips_warnings_notes.txt

.. highlight:: default

A few things to note here:

* the ``.. feature::`` is common throughout all RST, it is how you add notes, code, highlights, and files
* you need a blank line before and after your note/tip/warning
* your actual note needs to be indented once to be included in the box

Generally, you should include at least one blank line between 
anything special that you try to format, but it's necessary 
when working with these types of boxes.

The text I featured above will make the following boxes 
when included in an RST file

.. tip:: 

    Here is how to structure a tip.

.. note::

    Here is how to structure a note.

.. warning::

    Here is how to structure a warning.


Table of Contents
*****************

All of the pages thus far include some kind of table of 
contents at the top. This is helpful since it gives readers 
an overview of the topics covered on this page, as well as 
links to the different sections (specified by the headings).

To add a table of contents to your page, indlude the following 
text:

.. highlight:: none

.. literalinclude:: examples/toc.txt

.. highlight:: default

This will add a table of contents (with links) to your page.
There is one for this page if you want an example of how it works.

Code Blocks
***********

Code blocks can be a nice way to show different commands that 
you might need to run in order to complete the workflow you 
are demonstrating (or any other time you want to run commands).
There are two ways to do this, either a full code block 
or just changing the format of the text within paragraphs.

For example, if I want you to run a command as part of my 
workflow, I might include a full code block:

.. code:: shell

    ls *.xyz #this will list all xyz coordinate files in your directory

This type of code block is added with this format:

.. highlight:: none

.. literalinclude:: examples/adding_code_blocks.txt

.. highlight:: default

The other way to add code in RST files just changes the formatting 
of the text in the paragraph. There are examples of this throughout 
this page, but you can also see that ``here``. To add this kind of 
formatting to your text, just surround your command with two ` 
on each side of the command.

Lists 
*****

Adding lists is faily intuitive in RST. With one blank line on 
either side of the list, you can create a bulleted list by 
having each point start with a ``*`` and starting new lines for 
new points. Here is the format:

.. highlight:: none

.. literalinclude:: examples/lists.txt

.. highlight:: default

The code above will have the following effect on your page:

* item 1
* item 2
* item 3

Hyperlinks
**********

Hyperlinks are a way to provide your reader with more information 
while keeping the format and look of your page nice.
Here is the format of including a hyperlink on your page:

.. highlight:: none

.. literalinclude:: examples/links.txt

.. highlight:: default

Here is the result of that example: 
`CSU Theory Suite Wiki <https://csu-theory-suite.github.io/theory-suite-wiki/>`_

Including Additional Files
**************************

In the event that you want to add text from a 
file you already have, or if you want to include 
an image in your wiki page, you can add more files and 
include them within the RST file for your page.
You can do this in a very similar way to adding code blocks and 
the like, just with a different command.

One housekeeping tip here, I would make a new folder within your 
page folder called "examples" or "resources" if you are going to 
include different files within your page. This will keep things
orderly and neat and easy to find if you want to change anything up.

To add something directly to the page use this command:

.. code:: shell

    .. literalinclude:: resources/file_to_include.txt

.. warning::
    
    This will put the entirety of the file you want to include 
    in that space in your page, so make sure it's what you want!

You can also add figures to your page. To do this, I would 
include a line at the top which sets the "variable" that is 
your image. Then, you can call it at whatever point of the 
page you would like. To set the variable, you can do:

.. code:: shell

    .. |figure_name| image:: images/this_is_my_image.png

If you include this at the top of your page (before the title),
then later you can include the figure where you want with:

.. code:: shell

    .. centered:: |figure_name|

This will include the figure that you want centered on 
your page. Also, if you end up changing the figure you just 
have to update the file in ``images/``.



6. Save Your Changes to the RST Files
-------------------------------------

Once you have made all the changes that you want to your 
page on the wiki, now you start the process of putting 
those changes into action on the official website.
After you have made a set of related changes, you can 
"locally save them" to your local repository. 

.. note::

    It is best practice to only commit small changes at once,
    and make sure that everything you commit at a time is related.
    This will help with version control and make sure that 
    everything stays organized.

For example,
if you made changes to a file in ``graphical_software/`` and 
also in ``helpful_packages/``, you could "save" your changes 
with the following:

.. code:: shell

    cd ~/Documents/theory-suite-wiki/sphinx/
    git status #check that all the files in red are the ones you made changes to
    git add source
    git status #check that all the files you changed now appear green
    git commit -m 'Short descriptive message of the changes you made'

This will commit all the changes that you made to the local 
copy of the repository on your computer.

.. note::

    Remember to re-generate the local preview of the wiki to 
    visualize the changes that you made to make sure everything 
    is showing correctly. Also use this to double check for typos.

7. Pushing Results to Your Personal GitHub Fork
-----------------------------------------------

Now that we have made alterations to the files that we wanted 
to create/edit pages on the wiki, we want to make sure that 
the updated files exist both on our local computer and on the 
online version of GitHub. To do this, you run the command:

.. code:: shell

    git push origin master

This will sync the online version of your repository with the 
fork that you have been editing on your computer.

8. Creating a Pull Request
--------------------------

Now that the online version is synced with the local version 
you were editing, we need to create a pull request to add 
our changes to the primary repository owned by CSU-Theory-Suite.
To do this, we go to the online repository page of our personal 
fork, click on the ``Pull requests`` tab at the top left of the 
page, then select the green button labeled ``New pull request`` 
at the top right of the page.

Now, make sure that the base repository is the 
``CSU-Theory-Suite/theory-suite-wiki`` (on the left) and that the 
head repository is ours (on the right), then click ``Create pull request``.

Finally, write a short message as the title and description of the 
changes that we made. This is likely going to be read by whoever 
is acting as the admin of the repository (currently Alex and Raul) 
before they merge changes and add them to the primary website. 
The admin(s) might provide feedback on the changes (especially if 
you don't wait until 5 minutes before a presentation where the 
page needs to be active).

.. note::

    The current admins of this page are Alex (Paton group),
    Hojin (Kim group) and 
    Raul (Kim group). Feel free to ask them about becoming 
    an admin yourself if you're interested!

.. tip:: 

    Usually, GitHub will notify the admins when you have started 
    a pull request, but it never hurts to send them a message 
    via Slack or stop by their desks to let them know that 
    you created a pull request for the wiki.

After you write the message describing the changes that 
you made, click ``Create pull request`` to send if off. 
Now it's the admins' problem!

.. note::

    Even if the merge is accepted on the spot, there will 
    still be a short delay for the changes to be reflected
    in the actual webpage. Usually you can keep track of 
    it by checking for a yellow/green dot that will appear 
    next to the last comit of the CSU-Theory-Suite repo.
    Once you see a green checkmark, everything should 
    be set and good to go!

