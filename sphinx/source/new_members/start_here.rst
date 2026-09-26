==========
Start Here
==========

.. contents::
    :local:

Welcome to the Theory Suite! This page is a checklist for your first few weeks.
It links to the rest of the wiki rather than repeating it, so work through it in
order and follow the links as you go. If anything here is out of date, please fix
it (see :doc:`../adding_pages/how_to_add_pages`) so the next person has an easier time.

.. note::

    Account admins change every year or so. The current contacts for each resource
    are listed on the :doc:`../computing_resources/paton_computing_resources` and
    :doc:`../computing_resources/kim_computing_resources` pages. If a name there looks
    stale, ask in the group Slack.

Week 1: Accounts and Access
---------------------------

Request these early, since some take several days to be approved.

.. list-table::
    :header-rows: 1
    :widths: 30 70

    * - Resource
      - What to do
    * - Group Slack and GitHub
      - Ask your mentor to add you to the group Slack workspace and the lab GitHub
        organization. Set up two-factor authentication on GitHub.
    * - CSU VPN
      - Install the CSU VPN client so you can reach campus machines and RStor from off campus.
    * - Local workstations and ACME
      - Ask an admin for accounts (see :doc:`../computing_resources/paton_computing_resources`).
        Run ``AUTOTEST`` once your account works.
    * - Alpine (CU Boulder / CSU)
      - Request an account with your CSU NetID, then email ``rc-help@colorado.edu`` to be
        added to the group so you can use Gaussian.
    * - ACCESS (Expanse, Bridges-2)
      - Create an ACCESS ID at `access-ci.org <https://access-ci.org/>`__, send it to the
        group's ACCESS admin to be added to the allocation, and set up 2FA. Fill out the
        PSC Gaussian permission form for Bridges-2.
    * - RStor backup drive
      - Email CNS IT (cc Rob) to be added, then map the drive
        (see :doc:`../computing_resources/paton_computing_resources`).

Week 1–2: Set Up Your Computer
------------------------------

#. Learn the command line: :doc:`../computing_resources/terminal_basics`,
   :doc:`../computing_resources/essential_unix_commands` and
   :doc:`../computing_resources/file_system_layout`.
#. Create an SSH key **with a passphrase** and copy it to the machines you use
   (see :doc:`../computing_resources/working_with_computers`).
#. Instead of aliases, you can add each machine to ``~/.ssh/config``. This also lets
   ``ssh``, ``scp`` and ``rsync`` use the short names:

   .. code:: none

       Host acme
           HostName acme.chem.colostate.edu
           User your_username

       Host alpine
           HostName login.rc.colorado.edu
           User your_csu_netid@colostate.edu
           # reuse one authenticated connection so you approve Duo only once
           ControlMaster auto
           ControlPath ~/.ssh/cm-%r@%h:%p
           ControlPersist 4h

#. Install a Python distribution with an environment manager
   (`Miniforge <https://github.com/conda-forge/miniforge>`__ is a good default) and
   make one environment per project rather than installing everything into ``base``:

   .. code:: shell

       conda create -n myproject python=3.12
       conda activate myproject
       python -m pip install goodvibes aqme rdkit

#. Install a molecular viewer and builder (GaussView, Avogadro, or PyMOL; see
   :doc:`../graphical_software/edition_generation/pymol`), a text editor you like
   (e.g. VS Code with the Remote-SSH extension), and a reference manager.
#. Set up git and GitHub: :doc:`../computing_resources/using_github`.

Week 2–4: Your First Calculations
---------------------------------

#. Read :doc:`standard_protocol` for the overall workflow, from conformer search
   to reported free energies.
#. Learn how the queue works: :doc:`../computing_resources/running_commands`.
#. Work through at least one example workflow end to end, ideally with a system your
   mentor suggests:

   * :doc:`../running_calculations/example_aqme_workflow/example_aqme_workflow`
     (conformer search to QM inputs)
   * :doc:`../running_calculations/example_goodvibes_workflow/example_goodvibes_workflow`
     (thermochemistry and reaction profiles)
   * :doc:`../running_calculations/example_qcalibrate_ts_conf_search/example_qcalibrate_ts_conf_search`
     (transition-state conformer searching)

#. Reproduce a published number before trusting your own. A good first exercise is
   to recompute one barrier or selectivity from a group paper and compare.

Good Citizenship on Shared Resources
------------------------------------

*  **Never run calculations on login nodes** of Alpine, Expanse, Bridges-2 or ACME.
   Submit them to the queue. Short tests belong in a debug partition.
*  **Request what you use.** Match ``--cpus-per-task``/``--mem`` to your program's
   settings (``%nprocshared``/``%mem`` in Gaussian, ``%pal``/``%maxcore`` in ORCA).
   Over-requesting blocks other people and burns allocation.
*  **Allocations are shared and finite.** Check with your mentor before submitting
   hundreds of jobs, and keep an eye on usage.
*  **Scratch is not backed up** and is often purged automatically. Copy results you
   care about to project storage or RStor.
*  **Local workstations have no queue.** Check ``top``/``htop`` before starting a job
   and don't use every core on a machine that others are using.

Managing Your Data
------------------

*  Use one folder per project and a consistent naming scheme (e.g.
   ``SubstrateA_TS1_conf03_opt.log``). Tools like GoodVibes and AQME rely on
   predictable file names.
*  Keep scripts and analysis notebooks in a git repository; keep large outputs out
   of git and back them up on RStor.
*  Before you leave the group, archive each finished project on RStor under
   ``Completed_projects`` with a ``README`` that says what is where and which
   level of theory was used.

Where to Get Help
-----------------

*  Your mentor and the group Slack are the fastest route for anything lab-specific.
*  Cluster problems: Alpine (``rc-help@colorado.edu``), ACCESS
   (`ACCESS support <https://support.access-ci.org/>`__), local machines (an admin
   listed on the computing resources pages).
*  Software problems: check the program's manual and GitHub issues first, then ask.
   When you do ask, include the input file, the error message, and what you have tried.
