================
Running Commands
================

.. contents::
    :local:

Most of the information on this page comes from Dr. Bill Miller III at Truman State University.

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
However, you can also find the PID and kill a specific process with:

.. code:: shell

    kill -9 <PID_Number>

which will stop the process with that PID (found with ``top``).