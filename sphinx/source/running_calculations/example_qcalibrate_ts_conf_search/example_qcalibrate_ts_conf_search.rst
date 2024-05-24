====================
qcalibrate 
====================

.. contents::
    :local:

qcalibrate is a python script written in the Paton lab to assist 
with performing conformational sampling on transition state structures.
This conformational sampling will help ensure that you have the lowest 
energy structures and more accurate pathways, so it's an important 
part of research.

This script uses Gaussian and `CREST <https://crest-lab.github.io/crest-docs/>`_
and currently is only in place on ACME. My tutorial will go through 
the different steps that qcalibrate runs through in such a way that you 
can repeat this process manually if you are on another computer.

qcalibrate Processes
---------------------

This module will go through the steps of the qcalibrate script, 
as well as the location of each part in the event you will need
to troubleshoot the scripts. This will also serve as a step-by-step
guide for the event that you want to run the processes individually
or on another computer without qcalibrate.

Step 1: Modredundant Optimization
+++++++++++++++++++++++++++++++++

As the set-up for qcalibrate, you must create a Gaussian input 
file for a modredundant optimization of your transition state 
structure (more details in the Set-up section). 
This optimization is first run, with the bond 
constraints that you have set up for the transition state.
This step should not take very long, since you will be starting 
with an optimized transiton state.

The modredundant optimization is initially run to ensure that 
you have found a transiton state before you move along with 
the conformation search and following optimizations. There is 
a script which checks for imaginary vibrational modes in the 
Gaussian output files (``/opt/apps/bin/calibrate/check_im_freq``).
This is to ensure that you have a good starting point before 
spending more computing power on something that isn't a 
transition state after all.

This step of the process is called in the script 
``/opt/apps/bin/qcalibrate``.

Step 2: Constrained CREST Search
++++++++++++++++++++++++++++++++

Once your starting structure has been verified as a 
transition state structure, the constraints from the input 
modredundant optimization are used in a CREST conformation 
search. The script ``/opt/apps/bin/CALIBRATE`` will then 
convert the Gaussian output file into xyz coordinates and 
start a CREST search.

CREST constraints are put into a file named ``constrain.inp`` 
using a script ``opt/apps/bin/calibrate/constraints.py``. 
With these constraints, the conformational sampling is done
(called on line 66 of ``opt/apps/bin/CALIBRATE``).

Once the CREST search has finished, the structures will 
be clustered into 10 (or a number of your choosing) representative 
structures using the CREGEN module. Following the clustering 
(on line 76 of ``opt/apps/bin/CALIBRATE``), the output xyz files 
are converted into more Gaussian input files to proceed with 
the qcalibrate process.

.. warning:: 

    When this search is finished, qcalibrate also deletes all the 
    files that are unnecessary moving forward, so it might be 
    harder if you want to troubleshoot. To get around this, you 
    can create your own copy of the files and run them, 
    commenting out the line of code that cleans up 
    (line 114 of ``/opt/apps/bin/CALIBRATE``).

Step 3: Constrained Optimization
++++++++++++++++++++++++++++++++

Once you have the clustered conformations of your transition 
states, the same constraints/frozen bonds that were included 
in your initial qcalibrate input are applied to each structure 
and a constrained geometry optimization is started. These 
will all run in serial, so ``conf_01`` will run first, and when 
it has finished ``conf_02`` will start. This is part of why the 
process can take so long and it might be beneficial to increase 
the total wall time for your project.

.. note:: 

    These constrained optimizations also use the same level of 
    theory that you started with in your initial input file, 
    so be mindful of that when you create the input.

Once the optimizations are completed, they will be put into 
a folder called ``constrained_opts/`` and further analyzed.

At this stage, the output files are checked for imaginary 
frequencies (signifying a transition state), as well as 
filtered based on energy. GoodVibes is run on all the 
conformers that had a normal termination to get 
energy information about the ensemble. This is done as a 
way of reducing computational cost if the conformations are
too high in energy, as anything more than 5 kcal/mol higher 
in energy than the lowest energy conformer is discarded at 
this step.

Step 4: Unrestrained Transition State Optimization
++++++++++++++++++++++++++++++++++++++++++++++++++

After the modredundant optimizations have completed and high 
energy conformers filtered out, those geometries are used 
as starting points for an unrestrained TS optimization. 
The keywords used in the Gaussian input files are 
``opt=(ts,calcfc,noeigentest)`` as opposed to the ``opt=modredundant``
that the process was started with. These optimizations also 
take place in serial, so it can take some time to complete.

.. note::

    If you run out of time at this point, you should just 
    re-submit all of the input files that end 
    in ``*ts_conf_XX.com`` (XX represents conformer number), as 
    this is one of the last steps in the process. At this 
    point, it is just an ensemble of TS optimizations.

Once these jobs are complete, the files are checked for 
imaginary frequencies (those without are filtered out and 
moved to ``ts_fail/``) and GoodVibes is started again.
At this stage, conformers are still filtered out if they 
are more than 5 kcal/mol higher in energy than the lowest 
energy conformer, but at this point the geometries are 
fully relaxed to the transtion states. You will have an 
output labeled "best" that is the lowest energy TS 
conformer to come out of this protocol, but if you want the 
full ensemble structures are in the ``ts_opt/`` folder.

.. note::

    You should at this point visualize all of your conformers
    that you plan to continue with to ensure that they 
    represent the transition state that you want. This 
    protocol just checks to see that they have at least one imaginary 
    frequency that has an intensity greater than the cutoff, not 
    that it's the TS you were searching for or started with.

This is the end of the qcalibrate protocol. The output for each 
step will be in the individual folders created with each step.
Another file called ``calibrate.out`` will also be created which 
will give an overview of the whole process. This is a good place 
to look if anything seems wrong to start the troubleshooting 
process.

Set-up
------

If you are on ACME, then qcalibrate is already installed and ready to 
be called on the computer. If you are curious about any errors/troubleshooting, 
the code exists in the directory ``/opt/apps/bin/`` as ``CALIBRATE``, 
``qcalibrate``, and all files in ``calibrate/``.

You want to start with a Gaussian input file from an optimized 
transition state structure. So once you have found a transition state,
create an input file using that geometry and set up for a modredundant 
optimization. This includes putting these keywords in the route line for 
your calculation: 

.. code:: shell

    functional/basis opt=modredundant freq

For the optimization, you also need to specify bonds to constrain at the 
bottom of the file. Here, you will want to freeze the bonds that are 
involved in the transition state that you are trying to find. For example,
if your transiton state is for a bond formation between C1 and O4, 
the bottom of your input file should include this line:

.. code:: shell

    B 1 4 F

This will ensure that the correct constraints are imposed during the 
conformation search so you don't lose the transition state that you 
have.

Another key feature of this input is that you must specify a 
checkpoint file. You can do this wiht a simple line at the start of 
the file that looks something like this:

.. code:: shell

    %chk=file_name_ts_conf_search.chk

With all of these pieces you are ready to run qcalibrate and start 
performing a conformation search of your transition state. In case
these instructions were confusing, here is an example input for a 
proton transfer transition state between atoms 2 and 23 (with the 
proton being atom 27). This file includes an extra constraint between 
atoms 3 and 21 to ensure these atoms do not bond prematurely.

.. highlight:: none

.. literalinclude:: resources/mnah_ts1_example_input.txt

.. highlight:: default

Running the Code
----------------

This is an automated workflow, so it only takes one line to run 
all parts! If you don't want to run all parts of the code yet, I 
recommend creating your own copy of the code and running it 
individually. We are planning to add this kind of functionality to 
the existing script, but that isn't finished yet.

Once you have your input file created, you can easily run the 
code and start your conformer search. This code and be run with 
only one line, but there are a few arguments that you can 
implement to customize how the script runs. Here is the basic 
command you can use to run the script:

.. code:: shell

    qcalibrate -i name_of_input.com

Running qcalibrate creates a new directory in the working
directory where all of the jobs will be run. The new 
directory is named after the initial input file, and inside
more directories will be made for the constrained CREST search,
the constrained optimization, and the successful/failed TS optimizations.

This will start a slurm job with all default settings. Now, I will 
go through the different ways that you can alter the script.

.. note:: 

    All add-ons and ways to change the qcalibrate defaults 
    are also described if you run the command
    ``qcalibrate -h``.

Frequency Cutoff
++++++++++++++++

With the ``-f`` flag, you can change the frequency cutoff value. 
By default, when qcalibrate checks to make sure that Gaussian 
optimized (constrained or not) structures include at least one 
imaginary frequency, it also ensures that the frequency has a 
magnitude of at least 100 cm\ :sup:`-1`. This is a helpful feature, 
since it filters out any jobs that had insignificant imaginary 
frequencies that are not likely to be your transition state. 

If you know that the frequency of the transition state you're 
looking for is close to -1000 cm\ :sup:`-1`, then you can 
adjust the cutoff to make sure that you only search for large 
frequencies. Similarly, if the frequency of the transition state 
that you want is less intense than -100 cm\ :sup:`-1`, you can 
change the 
cutoff so that qcalibrate will keep your transition state structures.

Here is an example of implementing the frequency cutoff:

.. code:: shell

    qcalibrate -i name_of_input.com -f 1000

This command will only keep optimizations (constrained or not) if the 
output file includes an imaginary frequency of -1000 cm\ :sup:`-1` or 
higher in intensity.

Wall Time 
+++++++++

If you run the qcalibrate command with no flags, your job will 
be submitted to the slurm queue with a maximum wall time of one 
day (24 hours). This is, however, the maximum time for all steps 
of the qcalibrate process, so 24 hours might not be long enough for 
your conformer search to finish completely. If you want to increase 
your wall time, you can use the ``-t`` flag. With this, you can change 
your job to be able to run for any length of time (while it fits 
on ACME's time limits). 

An example of a command which changes the maximum wall time of the 
job is:

.. code:: shell

    qcalibrate -i name_of_input.com -t 1-12:00:00

This command will submit the qcalibrate job to the queue for 
a maximum time of 36 hours (or 1 day and 12 hours).

.. note:: 

    If you are requesting times that are longer than one day, 
    you can either include how many days and extra hours 
    (1-12:00:00) or the total number of hours (36:00:00) 
    to achieve the same effect.

Number of Processors
++++++++++++++++++++

Another customizable feature of the qcalibrate script is to 
change the number of processors that your job is running on.
The default value for processors to use is 16, but you can 
change this to use more or less, depending on your needs. 
You can alter the number of processors with the ``-p`` flag:

.. code:: shell

    qcalibrate -i name_of_input.com -p 8

This command will submit to 8 processors on ACME instead of 
the default 16. On ACME, you can submit to a maximum of 32 
processors per core.

Number of Conformers
++++++++++++++++++++

As part of the qcalibrate command, you can 
adjust the final number of conformers that you want to 
proceed with for the coformer search. After the initial search,
the CREGEN module of CREST is used to cluster the ensemble 
into a specified number of representative structures.

By default, the number of conformers to be considered each 
time you run qcalibrate is 10. However, you can adjust this 
number to suit your needs with the ``-n`` flag:

.. code:: shell

    qcalibrate -i name_of_input.com -n 5

This command will cluster to 5 representative structures after 
the initial CREST conformer search. These 5 structures will be 
used for DFT constrained optimizaitons and continue through
the workflow.

