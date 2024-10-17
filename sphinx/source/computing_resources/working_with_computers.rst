=========================
Working with Computers
=========================

.. contents::
    :local:

Much of the information on this page comes from Dr. Bill Miller III 
at A. T. Still University.

Here are a few tips that might be useful as you get used 
to working with computers in a research setting.

What Computer am I Working on?
******************************

When you can easily ssh from one computer to another it is easy
to get confused and not know which computer you are working on.
Thus, the command ``hostname`` was created to print out the name of
the host computer you are actively working on.

Remotely Accessing Computers or Clusters
****************************************

The great part of computational work is that you should never have
to leave your desk to do any work. You can be logged into a computer
halfway around the world and you should be able to work as if you
were there. The ``ssh`` command is what allows us this tremendous
flexibility. The general syntax for ssh is

.. code:: shell

    ssh [options] username@remote_computer_name

If your username on your local computer and the computer you
are trying to connect to are the same, then you do not need to
include the ``username@`` part of the command. Instead, it would
just be

.. code:: shell

    ssh [options] remote_computer_name

For example,

.. code:: shell

    ssh acme.chem.colostate.edu

In the above example, no options were included and I will not go
into detail about all the different options ``ssh`` has, but I
did want to mention the options for X-forwarding. If you include a
``-X`` or ``-Y`` flag between ``ssh`` and your destination, you
will enable X-forwarding during your connection. What does that
mean? That means you will be able to bring up GUIs (Graphical
User Interfaces) on the remote computer and they will display on
your local computer screen. So, for example, if you ssh to the
overlap cluster using X-forwarding

.. code:: shell

    ssh -Y acme.chem.colostate.edu

You must be aware that since you are running these
graphics remotely that anything you try to do will be slower than
if you were doing it on your own computer.

As a final note, there are subtle differences between using the
``-Y`` and ``-X`` flag options, but for practical purposes you
should not notice a difference and thus you can use either
interchangeably.

Who am I Logged In As?
**************************

In case you find yourself questioning your very existence and
who you are as a person, you can always ask your computer. Typing

.. code:: shell

    whoami

will print the username you used to login to your computer.


What Processes are Running in my Terminal Window
************************************************

ps
+++

The ``ps`` command is similar to the top command,
except instead of viewing all the processes that are running on your
computer, ``ps`` will only display the processes that are running in
your current shell/window. So clearly there are significantly less
processes shown using ``ps`` than ``top``, but if you are running
a bunch of
processes that are executing the same command, ps may be a better
way of displaying them for you if you need to terminate one of them.
``ps`` is also not dynamic. When you type ``ps`` the current processes
are
just printed to the screen and the command prompt is available for
another unix command.

top
+++

Occasionally it will be helpful to determine what processes are
currently running on your computer. For this situation, we have
the ``top`` command. ``top`` will display the processes currently
running in your Terminal window.
The processes are listed in descending order of %CPU usage.
The display is dynamic and updates every ~3 seconds. While
``top`` is being displayed, if you press 1 you will see the load
on each specific processor.

There are many columns of information displayed using ``top``,
some of which are self-explanatory and some of which aren’t
important to us. The ``PID`` column is an identifying number for each
command. If you need to kill one of these jobs while ``top`` is
running, press ``k`` and a line will be printed just above the
processes that says ``PID to kill:``. You can enter the ``PID`` number
and press ``enter`` to kill any of the jobs that are running.
You can also see if any other users are running processes on your
computer (someone might decides to try to hijack your CPUs or GPUs
if they don’t think you are using them enough). top also allows
you to view the percentage CPU (%CPU) and memory (%MEM) usage for
each process, the length of time the job has been running (although
this is not normal Earth time), and the name of the command that is
running.

Once you have finished examining top you can terminate it by just
pressing ``q`` on the keyboard to quit (or pressing ``ctrl+c``)

Learn About the Computer
************************

Depending on the machine that you are working on, there may be
a different architecture/setup of that computer. There can also be
different numbers of CPUs that are available for use on different
machines. One way to figure out this kind of information about the
machine you are working on is with with command ``lscpu``. When you
are on a linux machine, typing this command will give a lot of
information about the computer. The results of this command are
printed to the Terminal window. For example, typing

.. code:: shell

    lscpu

on Fireball of the Paton Lab gives the result:

.. code:: shell

    Architecture:          x86_64
    CPU op-mode(s):        32-bit, 64-bit
    Byte Order:            Little Endian
    CPU(s):                96
    On-line CPU(s) list:   0-95
    Thread(s) per core:    2
    Core(s) per socket:    24
    Socket(s):             2
    NUMA node(s):          2
    Vendor ID:             GenuineIntel
    CPU family:            6
    Model:                 85
    Model name:            Intel(R) Xeon(R) Platinum 8260 CPU @ 2.40GHz
    Stepping:              7
    CPU MHz:               3572.460
    CPU max MHz:           3900.0000
    CPU min MHz:           1000.0000
    BogoMIPS:              4800.00
    Virtualization:        VT-x
    L1d cache:             32K
    L1i cache:             32K
    L2 cache:              1024K
    L3 cache:              36608K
    NUMA node0 CPU(s):     0-23,48-71
    NUMA node1 CPU(s):     24-47,72-95
    Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid dca sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch epb cat_l3 cdp_l3 invpcid_single intel_ppin intel_pt ssbd mba ibrs ibpb stibp ibrs_enhanced tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm cqm mpx rdt_a avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local dtherm ida arat pln pts hwp hwp_act_window hwp_epp hwp_pkg_req pku ospke avx512_vnni md_clear spec_ctrl intel_stibp flush_l1d arch_capabilities

This command should give you any of the information that you are
looking for about a computer.


which - What Program am I Using?
********************************

The which command can be extremely useful for determining:

1) if a command is in your PATH and
2) the exact path to the executable

For example, if you want to know if the vmd program is in your
PATH, type

.. code:: shell

    which vmd

which should give the result

.. code:: shell

    /usr/local/bin/vmd

This tells you that vmd is in your PATH, so if you just type ``vmd``
the VMD program will open, and it tells you the VMD program that
will open is located in ``/usr/local/bin``. This is important
because sometimes you might have multiple copies of the same
program on your computer. If I wanted to use the beta version of
the VMD program I could download it from the VMD website and
install it on my computer. I would then have to put the beta VMD
bin directory in my PATH (using the instructions outlined in the
$PATH section) so that when I type ``vmd`` I will open the beta
VMD instead of the native VMD in ``/usr/local/bin/``.
Typing ``which vmd`` will let you know exactly which VMD you are
attempting to use.

Disk Usage Details
******************

Our computers only have a limited amount of storage, so it is useful
to know the disk usage details for our entire computer, as well as
folders on our computer. For this purpose we use the du command.
Typing the command ``du -h`` will print the size of every
subfolder within your current directory and print out the final
disk usage at the end. If you have many directories and
subdirectories within your current folder, the list printed to
the screen can become quite large.

The ``-s`` flag is intended to help remove all of the mess
and just give you the final details if that is all you want.
This is useful if you only care about the total size of a directory
and don't care about the size of individual subfolders.


Search for Files
****************

The ``find`` command searches a directory/path for files that match the
given expression provided by the user. The general syntax is

.. code:: shell

    find [path] expression

This command has a LOT of options.

An example find command is shown below to give you an idea of
what find can do.

.. code:: shell

    find $HOME -mtime 0

This command will search for files in your home directory that
have been modified in the last 24 hours.

``find`` is also capable of executing arbitrary bash commands with the
filenames it finds:

.. code:: shell

    find ./ -maxdepth 3 -mindepth 1 -name '*.com' -exec "cp {} ../../MoveFilesHere \;"

This command will parse through all folders 1-3 steps in the file
tree, select all of the files that end in ".com", and run the
``cp`` command to move those files into a new folder that you made.
The portion after the ``-exec`` can be any bash command you would like
to run on the files you've found.


Tell the Computer to Wait
*************************

The ``sleep`` command simply tells the computer to pause and wait for
a user-specified amount of time. I have really only found this
useful when writing scripts. The command does not return anything
or print any output. The general syntax is

.. code:: shell

    sleep #

where the number is the time you want the computer to wait for
in units of seconds. To make the computer wait 3 seconds you would
type

.. code:: shell

    sleep 3

Wasn’t that useful?


