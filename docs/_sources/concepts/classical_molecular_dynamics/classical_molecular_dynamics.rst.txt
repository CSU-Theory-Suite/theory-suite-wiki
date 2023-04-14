=============================
Classical Molecular Dynamics
=============================

.. contents::
   :local:

Classical Molecular Dynamics (MD) is a simulation technique that makes use of 
simplifying assumptions about the motions of molecular systems by using 
Newtonian mechanics.

Understanding the Basics
------------------------

Force Field
...........

An empirical potential energy function. If we know the forces acting in a system, 
we can calculate how particle positions will change with time using Newton's 
classical laws of motion. In order to calculate the forces :math:`\vec F` of 
each particle, we must have a functional description of the potential energy, U, 
as a function of coordinate space, r.

.. math:: 

   \vec F = -\vec\nabla U(r)

.. math::

   E_{total} = \sum_{bonds} k_{b} ( r - r_{0} )^2 \\
   + \sum_{angles} k_{\theta} ( {\theta} - {\theta}_{0} )^2 \\
   + \sum_{dihedrals} V_{n} ( 1 + cos( n \phi - \gamma) )^2  \\
   + \sum_{i=1}^{N-1} \sum_{j=i+1}^{N} \left[
   \frac{A_{ij}} {R_{ij}^{12}} - \frac{B_{ij}} {R_{ij}^{6}} + \frac{q_i q_j} {\varepsilon R_{ij}}
   \right]

In this equation, the terms :math:`k_b`, :math:`r_0`, :math:`k_{\theta}`, 
:math:`{\theta}_{0}`, :math:`V_n`, :math:`\gamma`, :math:`A_{ij}`, :math:`B_{ij}`
are parameters to be specified in the parameters files for the various Amber 
force fields. 

The energy equation does not have a special term for out-of-plane motions. 
Amber routines handle these terms through the same formulation as the torsion 
terms. 

Partial charges ( :math:`q_i , q_j` in the energy equation), although parameters also, do
not appear in parameter files, but are assigned differently. 


Standard Forces
...............

For each timestep in the simulation, the force on every atom is calculated. This is the most time-consuming component of the calculation.

Interatomic forces:

   1. Coulombic potential (attractive or repulsive, :math:`\propto r^{-1}`)
   2. Van der Waals (attractive, :math:`\propto r^{-6}`)
   3. Electronic (repulsive, :math:`\propto r^{-12}`)


Integration of Newton's Laws of Motion
......................................

Explaining how velocities and positions are stored at different offset steps and
updated accordingly. Algorithm for integrating Newton's laws of motion.

Stochastic Thermostats
......................

Thermostats maintain a constant temperature simulation. The system is coupled to
a heat bath that imposes the desired temperature. With stochastic thermostats, 
this is done by introducing stochastic (random), occasional forces (collisions) 
on randomly selected particles. The collisions are implemented to ensure the 
system's energy is appropriately distributed (according to a Boltzmann average).
Common examples include the Andersen and Langevin thermostats. 

Barostats
.........


Many experiments are performed under constant pressure, rather than constant 
volume, so it's very common to perform MD simulations with a constant pressure 
ensemble (i.e., NPT). One of the most common is the Monte Carlo Barostat.
   
Periodic Boundary Conditions
............................

Space is "infinite" tiled repeats of simulation box


Step 1: Prepare System
----------------------

1.1 Find/construct initial structure of your system
...................................................

Once you know what system you want to simulate, the easiest way to set up the 
system is to find a crystal structure representative of the system you are 
interested in. 

The `Protein Data Bank <https://www.rcsb.org>`__ is a database with collections 
of crystal structures 

You will want your initial structure file to be in the 
`pdb format <https://www.cgl.ucsf.edu/chimera/docs/UsersGuide/tutorials/pdbintro.html>`__

.. Tip:: 
   
   Always read the paper associated with a crystal structure. The 
   authors will disclose if mutations are present, and provide additional 
   information that may be important to know!

1.1.1 Do you want to simulate a system that has a ligand bound or unbound?
**************************************************************************

Do you want to simulate a system that has a ligand bound or unbound? 
If you have a ligand you will need to include additional force field 
parameters in following steps. A number of small organic molecules have 
been previously parameterized, so you will have to see if that is the 
case for your ligand. If it is not, you will need to develop the parameters. 
There are numerous methods to do this, most common is probably the RESP 
(C. I. Bayly et. al. J. Phys. Chem. 97, 10269 (1993)) procedure. Either 
way, if you parameterize something you should include that information 
in your SI!!! 

.. note:: 

   If you are keeping a ligand, you should save the ligand coordinates in SDF 
   format, and delete it from the PDB file. At this point you need to separate 
   protein and non-protein molecules (except ions and water) because they will 
   get different treatment in later steps. 

1.1.2 Is there a mutation in the crystal structure?
***************************************************

Pretty common. Easy fix, just delete the atoms that are not in the residue 
you want to be there, and change the three letter residue ID. A program used in 
later steps will be able to identify there are missing atoms in that residue 
and place them. 

1.1.3 Are there missing residues or heavy atoms?
************************************************

Probably, but it is only an issue if there are consecutive missing residues. 
There are programs that exist to try and predict positions of missing residues 
if this is the case, like `modeller <https://salilab.org/modeller/tutorial/>`__

1.1.4 Are there ions or cofactors present that you don't want to simulate? 
**************************************************************************

Probably. Just remove those lines from the pdb file. 

1.1.5 Do you want to keep crystallographic waters? 
**************************************************

Probably. 

1.1.6 Visualize your system
***************************

.. note:: 

   PyMol and VMD are my go-tos. 

See if anything looks wrong. For example, there should only be 1 of your system. 
In some crystallizations there are repeating units. 
Unless you intentially want to simulate repeating units 
(which you probably don't) delete the lines in the PDB file associated with 
repeats. 

1.1.7 Add 'TER' lines to the PDB
********************************

'TER' separates parts in the PDB file that are not covalently linked. 
If you have a dimer protein you should have two TER lines after the carboxylic 
acid terminal oxygens. You don't need to add TER between water molecules, tleap 
will do that for you.

1.2 tLEAP
.........

This is a program that is used to prepare input for AMBER. Before you do 
anything with tleap make sure you have adjusted any mutated residues. That way, 
you won't have to worry about adjusting the hydrogens,just the heavy atoms.

1.2.1 Protonate your system
****************************

.. code:: none

   > source leaprc.protein.ff14SB #load in a force field
   > source leaprc.water.tip3p #load in a force field
   > x = loadpdb FILENAME.pdb #load in a structure
   > savepdb x FILENAME_PROTONATED.pdb #saves pdb file with everything protonated
   > quit #exit

Hydrogens are typically unresolved in crystalization methods. 
This means the original pdb file will not contain positions of hydrogens. 
Therefore, you must protonate the system. HOWEVER! I like to protonate my system 
and then load it into a visualization software to evaluate protonation states, 
specifically of all HIS residues. Histidine's have two nitrogen atoms that can 
be protonated, and it will depend on the enrivornment which is more likely to 
be protonated. It is best practice to manually visualize each HIS residue and 
declare the protonation state.

Evaluating HIS protonation states:
++++++++++++++++++++++++++++++++++

.. code:: none

    PyMol> load FILENAME_PROTONATED.pdb
    PyMol> hide nonbonded
    PyMol> select "his_residues", resn hie # tleap automated chooses the epsilon N to be protonated
    PyMol> show licorice, his_residues     # show his_residues selection as licorice
    PyMol> util.cbac his_residues # color by element differently to see easily 
    PyMol> show sticks, byres all within 5 of his_residues

Now display the  sequence. Open pdb file in text editor and start looking at each
HIS. If you think the delta N should be protonated, go to that HIS in the pbd 
and change the HIE to HID for each atom. You also need to delete the HE2 
hydrogen atom line. When you load the pdb into tleap again it will detect there 
needs to be a HD2 atom added, and will do so automatically because you named 
that residue HID.

1.2.2 Solvate your system
*************************

Now we go back to tleap:

.. code:: none

   > source leaprc.protein.ff14SB #load force field 
   > source leaprc.water.TIP3P #load parameters for water 
   > x = loadPdb FILE_WITH_ADJUSTED_HIS_STATES.pdb #load protonated pdb file 
   > solvatebox x TIP3PBOX 12 #Solvate the complex with a cubic water box  
   > savepdb x FILENAME_SOLVATED.pdb #save your pdb with waters so you can determine how many waters  
   > saveamberparm x temp.prmtop temp.rst7 #doing this right now will tell you if your system has a net charge, and the total number of water molecules 
   > addions x Na+ Y #Neutralize system, might replace waters

Pay attention to any errors when loading in your pdb structure. An error 
likely means tleap isn't sure how to deal with something. Warnings on the 
other hand are just things tleap wants to bring attention to, but these 
likely aren't fatal. At this point, tleap will probaly give you a warning 
statement about an unperturbed charge of the unit. This means your system has 
a charge, and you probably want a neutral system. This is best done straight 
in the command line.

.. warning:: 

   **Important**: tleap has a tendency to undervalue the water density. It is 
   typically at a density of ~0.85 g/mL when we know water density should be 
   about 0.998 g/mL. This is an annoying feature of tleap. You should keep this 
   in mind when trying to calculate how many ions you need for a particular 
   ionic concentration. When you are running your simulations you will perform 
   some steps in the NPT ensemble which will allow the box volume to equilibrate, 
   resulting in correct density.

If you did the saveamberparm command you will see how many waters your system 
has. Or you should do the following: In a separate terminal window I use the 
command :code:`grep -c 'WAT' ~SOMEPATH/FILENAME_SOLVATED.pdb`. Divide this 
number by 3 to get the number of water molecules in your system.

I have a code that then will determine how many ions you should add:

.. code:: python

    import numpy as np 
    import sys 

    water_residues = int(sys.argv[1])
    desired_ionic_conc = float(sys.argv[2])

    avo = 6.022e23      # molecules/mol 
    water_mm = 18.01528 # g/mol 

    water_conversion = 1e-24/water_mm*avo  # molecules of water/A^3 

    water_volume = water_residues/water_conversion # A^3 

    number_of_ions = desired_ionic_conc/1000/1e24*6.022e23*water_volume # molecules

    print(f'You need to add: {number_of_ions} ions')


An example of how to run the code for a number of water molecules = 30000 and an 
ionic concentraion of 0.5: 

.. code:: none 
   
   > python code.py 30000 0.5

Now, back to the tleap window: 

.. code:: none 

   > addions x Na+ XX # However many you need for desired concentration  
   > addions x Cl- XX # However many you need for desired concentration  
   > check x # You will probably get Warning:Close contact.. and that's okay.
   > saveamberparm x FILENAME.prmtop FILENAME.rst7 # Save AMBER topology and coordinate files 
   > savepdb x FILENAME.pdb # save your pdb with ions and waters 
   > quit # exit

.. note:: 
   
   tleap will automatically generate a ``leap.log`` file. You should keep this! 
   Why not include in your SI so others can see exactly how you prepared your 
   system! It's a pretty large file though...

.. Tip:: 

   _ALWAYS_ visualize the system when you think you're all done!

Step 2: Minimization
--------------------

We must minimize our system such that we are starting our simulations in a local
energy minimum. The crystal structure probably has some structural artifacts as 
a result of the procedure. We don't care for that. It is possible that if you 
start a simulation from the crystal structure your system could immediately blow
up due to extreme forceson any one atom, causing the atoms to move an 
unreasonable amount in a single timestep. Thus, there are minimization 
algorithms we appy to the system (such as steepest descent). Minimizations are 
typically done in two steps: 1) water minimization, to allow the solvent to 
relax around your solute, and 2) system minimization, where you allow the solute
to relax.

Preliminary minimization
........................

First we will run an initial minimization. For that we will create a file 
with the appropriate parameters that we will name as ``min.1.in``. Here we 
can see a general example of the contents of this file. 

.. highlight:: none

.. literalinclude:: resources/min.1.in

.. highlight:: default

To run: 
   
.. code:: shell
   
   AMBERHOME/bin/pmemd.cuda -O -i ../min.1.in -o igps_wt_apo.w_ions_solv.min.1.out \
   -r igps_wt_apo.w_ions_solv.min.1.rst -x igps_wt_apo.w_ions_solv.min.1.mdcrd \
   -c ../igps_wt_apo.w_ions_solv.rst7 -p ../igps_wt_apo.w_ions_solv.prmtop \
   -ref ../igps_wt_apo.w_ions_solv.rst7 -inf igps_wt_apo.w_ions_solv.min.1.mdinfo


Preliminary minimization follow up
..................................

Next we create the file ``min.2.in`` to follow up our previous minimization. Here 
we have an example of the contents for a general example. 

.. highlight:: none

.. literalinclude:: resources/min.2.in

.. highlight:: default

To run: 
   
.. code:: shell
   
   AMBERHOME/bin/pmemd.cuda -O -i ../min.2.in -o igps_wt_apo.w_ions_solv.min.2.out \
   -r igps_wt_apo.w_ions_solv.min.2.rst -x igps_wt_apo.w_ions_solv.min.2.mdcrd \
   -c ../minimization.1/igps_wt_apo.w_ions_solv.min.1.rst -p ../igps_wt_apo.w_ions_solv.prmtop \
   -inf igps_wt_apo.w_ions_solv.min.2.mdinfo \

And this is a good point to visualize your system, and make sure it hasn't 
deviated too much from the initial crystal structure. The way I recommend doing 
this is in VMD: 

   1. Load in your initial PDB (The one you made in tleap)
   2. Load in a PDB from after your minimizations (cpptraj one-liner to generate
      a pdb from MD coordinates: 
      ``cpptraj -p topology-file.prmtop -y coordinate-file.coords -x output-file.pdb``) 
   3. In VMD go to Extensions > Analysis > RMSD Calculator > select a molecule 
      and click Align. 
   4. Now you just want to make sure nothing crazy is happening, like any 
      tertiary or secondary structure issues, for example. 
   
   
Step 3: Heating
---------------

Now, we must invest some simulation time into unbiasing our system, and getting 
it to the right thermodynamics properties, such as a particular temperature. 

We will create the file ``heating.in`` with the parameters for the protocol. 
here we can find an example of the contents of this file: 

.. highlight:: none

.. literalinclude:: resources/heating.in

.. highlight:: default

To run:
   
.. code:: shell
   
   AMBERHOME/bin/pmemd.cuda -O -i ../heating.in -o igps_wt_apo.w_ions_solv.heating.out \
   -r igps_wt_apo.w_ions_solv.heating.rst -x igps_wt_apo.w_ions_solv.heating.mdcrd \
   -c ../minimization.2/igps_wt_apo.w_ions_solv.min.2.rst -p ../igps_wt_apo.w_ions_solv.prmtop \
   -inf igps_wt_apo.w_ions_solv.heating.mdinfo -ref ../minimization.2/igps_wt_apo.w_ions_solv.min.2.rst


Step 4: Equilibration
---------------------

How do you know if your system is equilibrated? Eh.. you don't ever know... but 
you can convince yourself it probably is by evaluated properties. For example, 
if you have an NVT system you can plot volume as a function of timestep and 
ensure it is fluctuating around the same value with minimal drift. Another 
common metric, especially for biomolecules, is to examine the root mean squared 
fluctuations (RMSF) or root mean squared deviations (RMSD) of the residues as a 
funciton of time. 

Again we will create an input file with the appropriate parameters that in this 
case we will name as ``equilib.in``. Here we have an example of its contents: 

.. highlight:: none

.. literalinclude:: resources/equilib.in

.. highlight:: default

To run:
   
.. code:: shell
   
   AMBERHOME/bin/pmemd.cuda -O -i -O -i ../equilib.in -o igps_wt_apo.w_ions_solv.equilib.out \
   -r igps_wt_apo.w_ions_solv.equilib.rst -x igps_wt_apo.w_ions_solv.equilib.mdcrd \
   -c ../heating/igps_wt_apo.w_ions_solv.heating.rst -ref ../heating/igps_wt_apo.w_ions_solv.heating.rst \
   -p ../igps_wt_apo.w_ions_solv.prmtop -inf igps_wt_apo.w_ions_solv.equilib.mdinfo\

.. Tip:: 

   Prior to production runs, you may need need an additional 
   "equilibration period". For example, if you switch to an NPT ensemble, 
   you will need to allow your box volume to adjust to the density of your 
   system (especially if you use tleap to solvate!). In my personal workflow 
   outlined here I "throw out" the first 250 ns of my production run (the next 
   MD step) which I run in the NPT ensemble. So, essentially those first 250 ns 
   are an additional equilibration period. All the production run trajectory 
   after 250 ns are used for analysis.

Alternatively, if you imposed any restraints during equilibration that are 
removed in the production run you should account for another period of equilibration.

.. warning:: 

   Volume is important to evaluate! In these input files for my production runs 
   I specify the 'cut' flag to be 12.0. This means my long range electrostatics 
   are calculated up to a 12.0 Å cutoff. The importance of this is that this 
   number **MUST** be smaller that the longest length of my protein minus the 
   smallest box dimension. Otherwise, there could be artificial physical 
   interactions calculated between periodic images. In the next MD step I 
   explain how I calculate this using VMD. I do this after my equiibration is 
   'complete' (before the trajectory I actually use for analysis).


Step 5: Production
------------------

This will be the data collected for analysis! The essential difference between 
production and equilibration is simply that we plan to analyze the production 
data. You never want to perform production runs immediately after altering 
something about your system (temperature, number of molecules, box size, 
ensemble, etc). If any of that is done you must give your system time to 
equilibrate. Otherwise, your data will contain artifacts, and thermodynamic 
property calculations will not hold true because your system was not at 
equilibrium. It is common practice to discard some initial chunk of production 
run trajectory to further ensure the data you analyze is of the equilibrated 
system. The way I have set up my protocol I run equilibration in the NVT 
ensemble, but the production runs are NPT, which allows the box the relax to the 
appropriate volume (which is definitely necessary if you solvated with tleap 
because the water density was low to start with). Because of this, it is 
absolutely critical that you observe the volume changes after the first few 
nanoseconds of production run. Specifically, you must ensure that the box 
volume is still large enough that your system won't start to interact with its 
periodic images. You must measure along the longest axis of your system, then 
add your longe-range non-bonded cutoff value specified in your input file to 
that number. This is the MINIMUM value for your box dimensions. For example, 
say your sistem is 74 Å, and you use cut=12.0, then your equilibrated box 
dimensions must all be more than 86 Å. 

Possibly one of the most difficult decisions now is to decide what data to 
store, and how often to store it. One thing to keep in mind is the time 
correlation of variables form your simulation. MD observations are 
time-correlated, therefore it is unneccesary and problematic (in a redundant 
manner) to store data at each point in time. You must store data in time steps 
less than the autocorrelation for that specific observable. Alas, we would 
have no way of knowing the autocorrelation time of a variable until we 
determine it from simulation, so it is essentially unavoidable to store some 
redundant data. 

Finally we arrive to the creation of our ``production.in`` file with the 
parameters for the actual MD simulation. Here we can see a general example of 
the contents of this file: 

.. highlight:: none

.. literalinclude:: resources/production.in

.. highlight:: default

To run:

.. code:: shell
  
   AMBERHOME/bin/pmemd.cuda -O -i ../Production.in -o 1gpw_holo_wt.prod.prod.out \
   -r 1gpw_holo_wt.prod.prod.rst -x 1gpw_holo_wt.prod.prod.cd \
   -c ../Production_correct_ntwx.prev_prod/1gpw_holo_wt.prod.prev_prod.rst \
   -p ../1gpw_holo_wt.prmtop -inf 1gpw_holo_wt.prod.prod.mdinfo 


