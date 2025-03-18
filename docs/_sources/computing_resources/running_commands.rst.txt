================
Submitting Jobs
================

.. contents::
    :local:

Most of the information on about linux processes comes from 
Dr. Bill Miller III at A. T. Still University.

There are a couple different ways of running/executing commands 
and calculations. Typically, if you are going to execute a command 
straight from the command line on your local computer, then that 
is called running a command (or job/calculation) interactively. 
Interactive jobs run immediately after you execute them regardless 
of the other processes that are occurring already on the computer 
that it may or may not conflict with for the available resources. 
If you run a job on a cluster (or supercomputer) you are likely 
running the command through a queue where you have to share 
resources with the other users and the queue scheduler 
(which is a script/program itself, not a real person so don’t 
try to bribe the scheduler; he doesn’t need your money) 
distributes calculations to free compute nodes that have enough 
available resources to run the program. This section of the 
manual, though, will focus on running jobs interactively on a 
local computer/workstation. 

Scripts and calculations expected to take limited resources or 
very little time can simply be run from the command line without 
any real considerations. However, when calculations are expected 
to take long periods of times (i.e. more than a few minutes), 
I have a few suggestions that might help. 

Halting and Canceling Interactive Processes
********************************************

If you are running a job interactively (i.e. the command prompt is 
unresponsive will the command is running), then you can press 
``ctrl+C`` to cancel/kill the process at any time while it is running. 
This will terminate the job from running any longer. 

Additionally, you have the option to halt or suspend an interactive 
process while it is running using ``ctrl+Z``. In other words, you can 
press ``ctrl+Z`` while a command is running and this will temporarily 
suspend the process from running. It halts, but it is not killed. This 
allows you to use the Terminal’s command prompt again while the job is 
halted. At any point, you can continue running the job by typing ``fg`` to 
bring the command back to the foreground. 

Running in Background vs Foreground, and nohup
**********************************************

A typical, short calculation is run in the foreground. This means when you 
execute the command, the command prompt on your Terminal becomes unresponsive 
until the process has completed. For long processes, I suggest running commands 
in the background. This allows the job to continue running in the background 
(i.e. without you knowing any difference) and for you to be able to use that 
Terminal’s command prompt to do other things. 

To run a job in the background, simply append an ampersand (&) to the end of 
the command. So if I were going to run a Gaussian 16 QM calculation in the 
foreground, the command would simply be  

.. code:: shell
    
    g16 structure.com 

But if I wanted to run that same calculation in the background, the command 
would look like this 

.. code:: shell 
    
    g16 structure.com & 

When you press enter to run this command, a line will be printed to the screen 
letting you know the job is running 

.. code:: shell
    
    [1] g16 structure.com & 

At this point (i.e. after this previous line is printed to the screen), if 
you press enter again your cursor will be back on the command prompt and you 
will be able to use your Terminal window to do more unix-y (yeah, that’s a word) things. 

Occasionally, I accidentally execute a command without adding the ampersand at the 
end when I really wanted to run the job in the background. So instead of running in 
the background, the calculation is running in the foreground. In this situation, I 
press ``ctrl+Z`` to suspend the job. This means the job is simply waiting for you to 
let it know it can continue running. If you want the job to begin running in the foreground 
again (as it was originally), you could type ``fg`` (short for foreground). But if you 
are like me, and wanted to run the job in the background, simply type ``bg`` (short 
for background; see how they did that?) and press enter on the command prompt and the 
job will begin running again but now in the background (and you will get a notification 
line like the one mentioned above when I explained how to run g09 in the background). 

An extremely helpful program when running process in the background is the ``nohup`` 
command. ``nohup`` can be added at the beginning of any command and essentially what 
it does it ensure that your job continues running, even if you logout of your computer. 
This is especially helpful if you are using a public or lb computer that others users 
access, or if you are working remotely (i.e. ssh’d into another computer) because using 
``nohup`` means you can exit (or logout) the remote workstation and your process/command 
will continue to run. I use this frequently if I am running a command remotely just in 
case the connection between my computer and the remote computer is broken. If you do 
not use ``nohup``, when the connection is severed, your command will be terminated. 
Continuing with the Gaussian 09 theme, if we wanted to initiate a g09 calculation 
on a remote computer using nohup, the command would look something like this 

.. code:: shell
    
    nohup g16 structure.com & 

Notice that in addition to using ``nohup`` at the beginning of the command, we 
also made the process run in the background (using the &). If you run a 
command using ``nohup`` in the foreground, then you are defeating the purpose 
of using nohup altogether since you are unable to use your Terminal’s command 
prompt and when you close the Terminal window or the connection to the remote 
computer is lost, your calculation would be killed.

Listing and Killing Jobs Running in Background
**********************************************

I have already described to you how to run commands in the background. As long as 
you are still using the same Terminal window/tab you used to execute the background 
commands, you can type the command jobs to see what processes are running in the 
background. 

Two processes are distinguished by the [1] or [2] shown at the beginning of each 
line. If for some reason I wanted to kill the first job (which I could do 
using the kill command along with the corresponding PID number), 
I could simple type 

.. code:: shell

    kill %1

and press enter. Similarly, to kill the second job I would just type 

.. code:: shell

    kill %2

In the event I am running a job in the background, I find using jobs 
and ``kill %`` much more convenient than determining the PID 
number from ``top`` or ``ps`` and using the ``kill -9`` command. 

The ``kill`` command is used to terminate processes that you are
running on your computer. The general syntax for the ``kill``
command is

.. code:: shell

    kill -9 PID

The ``-9`` is added to smother the process so it has no chance of
survival. The ``PID`` is a number that identifies each running
process. You can obtain the ```PID`` of any process using either the
``ps`` or ``top`` commands. This should only be used on the local
linux machines, as SLURM has it's own way to kill/cancel a job.

Using a SLURM Queueing Manager
******************************

SLURM is what we use on ACME and on many high-performance 
computing clusters. It is a system manager that implements a 
queueing system for job submission, making sure that all users can 
run jobs even if nodes are not currently available. Here are a few 
helpful commands for using SLURM:

Submit SLURM Jobs
+++++++++++++++++

On clusters, you often cannot run jobs/processes on the head node, instead 
needing to submit to other nodes meant to handle these changes. This means 
that you can't submit jobs the way you can on local linux machines. Rather 
than just running a command, it's necessary to submit it to the queue. 

To do this, you need to first make a submission script, such as this script 
to perform a CREST conformational search on ACME:

.. code:: shell

    #!/bin/bash
    #SBATCH -J crest_job
    #SBATCH -p normal
    #SBATCH -t 12:00:00
    #SBATCH --export=NONE
    #SBATCH --ntasks-per-node 16
    #SBATCH --mem=96G
    #SBATCH --output=%x.slurm_%J.out
    
    # XTB
    export XTBHOME=/opt/apps/xtb
    export PATH=$PATH:$XTBHOME
    xtbjob=crest_search_input.xyz
    Sctchpath="/tmp/$SLURM_JOB_ID"
    mkdir $Sctchpath

    Homepath=$(pwd)

    cp "$xtbjob.xyz" $Sctchpath

    cd $Sctchpath

    # Add useful info to top of output file

    touch $Homepath/$xtbjob.out
    echo "Job Start Time: $(date)" > $Homepath/$xtbjob.out
    echo "SLURM Job ID: $SLURM_JOB_ID" >> $Homepath/$xtbjob.out
    echo "SLURM Job Name: $SLURM_JOB_NAME" >> $Homepath/$xtbjob.out

    export PATH=$PATH:$XTBHOME/bin:
    $XTBHOME/crest $Sctchpath/$xtbjob.xyz --alpb water -T 16 -niceprint >> $Homepath/$xtbjob.out
    rm -r METADYN* NORMMD* MRMSD wbo cregen_* coord*
    mv crest_conformers.xyz $Homepath/$xtbjob.confs.xyz
    mv crest_best.xyz $Homepath/$xtbjob.best.xyz
    mv struc.xyz $Homepath/$xtbjob.struc.xyz
    rm ./crest*

It is important to note the section at the top, all of the ``#SBATCH`` lines.
The different flags mean different things to help tell the computer how to 
allocate resources to you. The ``-J`` sets the name of your job, here "crest_job".
``-p`` sets the partition you are going to submit to. This can be different for 
different clusters. For ACME, we have a "normal" partition, a "short" partition,
a "long" partition, and a "debug" partition, all with different maximum wall times 
and priorities in the queue. ``-t`` sets that maximum wall time. In this case, 
your job will run no longer than 12 hours (12:00:00). There are also lines that 
specify the number of processors you want to use (``--ntasks-per-node 16``) and 
the memory you are allocating to the job (``--mem=96GB``). There are more lines
that you can specify, but these are the most important.

Once you have made a file like this, you can submit it to the queue with

.. code:: shell

    sbatch crest_submission_script.sh

Then your job will be submitted to the queue and run when it is your turn. 

.. hint::

    There is a very easy way to create the submission scripts and submit 
    jobs on our cluster ACME: ``gsub``. This command creates a submission 
    script and automatically adds your job to the queue with the 
    specifications you listed. You run this command with 
    ``gsub input.com`` and can change specifications with different flags.
    To see what the options are, you can run ``gsub -h`` to get a list 
    of the different ways to adjust the script.


Checking on Jobs
++++++++++++++++

With the queueing system, it's possible that your jobs don't start 
immediately. You might want to check on them in the queue to see 
if they've started already. You can do this with 

.. code:: shell

    squeue

which will show you all the jobs in the queue. Often, you are only 
interested in your own jobs, which you can do with

.. code:: shell

    queue -u <USER>

These are very easy to add as aliases in your ``.bashrc`` to make it easier.
Here are the ones that I have set up:

.. code:: shell

    alias squ='squeue --format="%.7A %.35j %.10u %.7C %.10M %.15l %.20R"'
    alias q='squeue --user=`whoami` --format="%.7A %.35j %.10u %.7C %.10M %.15l %.20R"'

The extra ``--format`` tags just expand the display for this command to include 
the maximum wall time and number of processors requested, as well as a larger 
space allotted for the job title.

It may also be helpful to look into the 
`Slurm Job Tracking <https://csu-theory-suite.github.io/theory-suite-wiki/helpful_packages/inhouse.html#slurm-job-tracking>`_ 
developed within the group.

Cancel SLURM Jobs
+++++++++++++++++

Information for this section comes from `Stack Overflow <https://unix.stackexchange.com/questions/424871/how-to-cancel-jobs-on-slurm-with-job-idjob-number-bigger-than-a-certain-number>`_.

Using SLURM for job scheduling/queueing can be a really helpful 
tool for keeping track of jobs and sharing resources. However,
sometimes you might make a mistake for a large number of job 
submissions and want/need to stop them. Here are a few commands 
to help with this.

First, maybe you have one job you want to cancel. This is easily 
soved with the following command:

.. code:: shell

    scancel <JOB ID>

You can find the Job ID for your job with the ``squeue`` 
command under "JOBID". Each job has a distinct Job ID,
so you only have to worry about cancelling yours.

Another thing that may happen is that you submitted a lot 
of jobs with some major flaw, such as an incorrect basis 
set. If you want to cancel all of your jobs, use:

.. code:: shell

    scancel -u <USERNAME>

This will cancel **all** jobs in the SLURM queue that are 
associated with your account. 

In the event that you submitted several jobs, then submitted 
several more, but want to only keep the new submissions, you 
can cancel ranges of Job IDs at a time. For example, if you 
started jobs 1000-1010, then started 1015-1030 without canceling 
the original 10 jobs, there is still hope! Cancel these jobs with:

.. code:: shell

    scancel {1000..1010}

This cancels all jobs with Job IDs between and including 1000 and 1010.
This can also be helpful if you have too many jobs started and 
need to stop some to help with organization.