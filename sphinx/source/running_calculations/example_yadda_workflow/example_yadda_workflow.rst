=====
YADDA
=====

.. contents::
    :local:

Installation
------------

YADDA is still currently a work in progress, but here is the way that 
you can install it and use the program.

First, go to the `GitHub page <https://github.com/patonlab/yadda/tree/main>`_ 
and click on the green ``Code`` button at the top right of the page. This 
will allow you to copy the ssh link which will allow you to clone the 
repository to a computer. Copy this link (will start with git@github.com:) 
and return to your computer, where you will type

.. code:: shell

    git clone <ssh link>

This line will copy the current GitHub repository to your computer, including 
all the scripts you need to run it.

.. warning:: 

    One thing to note, this will not work if you do not have a GitHub 
    ssh key set up already for the computer you are working on. You 
    can find more information `here <https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-ssh-urls>`_.

Once you have the package cloned to your computer, you can add it to 
your PYTHONPATH variable to allow YADDA to be run as a module. 

For example, if you cloned YADDA into your home directory (``/home/username/``),
you will add this line to your ``.bashrc``:

.. code:: shell

    PYTHONPATH="${PYTHONPATH}:/home/username/yadda/yadda"

and ``source`` your ``.bashrc``, then you will be able to run the 
script easily. 


Preparation 
-----------

For this script to work, there are a few files that you'll need. 
Additionally, this only currently works on the local linux machines 
(not ACME), such as ``Buzzsaw`` or ``Fireball``.

IRC Output File 
+++++++++++++++

First, you need an IRC calculation that shows that path from the 
reactants to the transition state structure. Often, this is done only 
for the lowest energy conformation of the transition state. Additionally,
this calculation should show a fairly smooth IRC with a lot of points to 
ensure that you'll be able to draw meaningful conclusions from the results.

Example Input File 
++++++++++++++++++

One thing you'll need is an example input file (or at least the bones of 
one) for the program to use when formatting the inputs for the calculations 
that will be run along the IRC. Here is an example for qchem:

.. highlight:: none

.. literalinclude:: resources/qchem.inp

.. highlight:: default

.. warning:: 

    This example file does not include solvation, so if you want 
    that in your EDA calculations you'll have to include it.

YADDA Input File 
++++++++++++++++

The last required file for these calculations is the actual YADDA 
input file. This file includes all the flags that you plan on using, 
and it's also where you specify the file names that you will be 
calling during the calculation. Here is an example for this file:

.. highlight:: none

.. literalinclude:: resources/almo_da.inp 

.. highlight:: default 

This file has noted a few things that are optional and required for the 
calculation and can serve as a guide for a few of the things you can do.

.. warning:: 

    Make sure you are directing to the correct version of QChem for this!


.. note:: 

    This input file has a section where you can define the bond(s) that 
    are forming/breaking in your transition state so that you can 
    plot/analyze the data along a physical coordinate of the reaction 
    (such as bond length).


(optional) Optimized Reactant Files  
+++++++++++++++++++++++++++++++++++

These aren't required, but can help in the distortion-interaction calculations 
by giving an optimized baseline for the reactants. If these are not specified, 
the program will use the endpoint of the IRC as the optimized reactant structures.

ALMO-EDA Calculations 
---------------------

This program currently works with QChem to perform 
ALMO-EDA calculations at each point along an IRC calculation. The 
files I've included earlier are examples for this kind of calculation, 
and with small adjustments they can be altered to fit your particular 
system. The main thing distinguishing this type of calculations from 
others is the inclusion of ``ALMO`` in the input file.

If you have all the required (and optional) files in the same 
folder, you can run this program with: 

.. code:: shell 

    python -m yadda -i input_file.inp > output_file.out

.. hint::

    I would recommend running this in the background with 
    ``nohup python -m yadda -i input_file.inp > output_file.out &`` 
    since you're running a lot of single point/EDA calculations and 
    it's going to take a while.

Once the calculations are finished, you will be left with a CSV 
file with all the calculated data, which you can use to plot the 
results. An example Jupyter Notebook which plots the data after the 
input of a CSV file can be found on the 
`GitHub Page <https://github.com/patonlab/yadda/blob/main/example_almo_eda/plot_results.ipynb>`_.

QM Calculations 
---------------

If you do this, please add a section about how it works!


ONIOM-EDA Calculations 
----------------------

If you do this, please add a section about how it works!
