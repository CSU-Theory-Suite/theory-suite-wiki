.. |QH-correction| image:: images/QH_correction.png
.. |PhPy-PES| image:: images/Rxn_profile_PhPy.png

==========================
GoodVibes 
==========================

.. contents::
    :local:

Here is the `GoodVibes GitHub Page <https://github.com/patonlab/GoodVibes/>`_

Here is the `GoodVibes Publication <https://f1000research.com/articles/9-291/v1>`_

Installation
-------------

Version 4.2.0 is most up to date and required Python >= 3.9. Install with:

.. code:: shell

    pip install goodvibes

or

.. code:: shell

    uv pip install goodvibes

or 

.. code:: shell

    conda install -c conda-forge goodvibes

(you may also need to install matplotlib)

Computing Thermochemistry for QM Output Files
----------------------------------------------

You can run this code using any output file from QM calculations.
 
.. code:: shell

    goodvibes H2O.log

You should get the following output:

.. highlight:: none

.. literalinclude:: resources/jupyter_outputs.txt
    :start-after: water-start
    :end-before: water-end

.. highlight:: default


Grabs Energy, frequencies, and computes thermochemical values Enthalpy (H), Entropy (S), Gibbs Free Energy (G).
Also computes quasi-harmonic corrected Entropy (qh-S) and Free Energy (qh-G).

Compute G as ``G = H - (T * S)``

Temperature Corrections
-----------------------

The default temperature in GoodVibes is ``298.15 K`` (25C)

What if the reaction was run at 100C?

.. code:: none

    goodvibes benzene.log -t 373.15

This will give the following output:

.. highlight:: none

.. literalinclude:: resources/jupyter_outputs.txt
    :start-after: benzene_temp-start
    :end-before: benzene_temp-end

.. highlight:: default

GoodVibes can also compute temperature ranges.

.. code:: none

    goodvibes benzene.log H2O.log --ti 250,400,50

This will give the output:

.. highlight:: none

.. literalinclude:: resources/jupyter_outputs.txt
    :start-after: benzene_water-start
    :end-before: benzene_water-end

.. highlight:: default

This computes the thermochemical values for both output files at temperatures ranging from 250K to 400K every 50K.

Quasi-Harmonic Corrections
--------------------------

.. centered:: |QH-correction|

The quasi-harmonic correction has a greater effect when molecules have a greater number of low-frequency vibrational modes.
For example:

* Methylaniline: 2 vibrational modes below 200 cm\ :sup:`-1`
* Int-III: 23 vibrational modes below 200 cm\ :sup:`-1`

.. code:: shell

    goodvibes methylaniline.log Int-III.log

This gives the output:

.. highlight:: none

.. literalinclude:: resources/jupyter_outputs.txt
    :start-after: methylaniline-start
    :end-before: methylaniline-end

.. highlight:: default

Single Point Calculations 
-------------------------

Useful for saving on computational resources:

We can optimize molecules at a lower level of theory to still obtain an accurate geometry, but do a single point energy calculation (SPC) at a higher level of theory to obtain more accurate energy values.

With the ``--spc`` argument, we can specify how the SPC file names are formatted.

.. list-table:: File Naming Scheme
    :header-rows: 1

    * - Calculation Type
      - Filename
    * - opt/freq
      - file.log
    * - SPC
      - file_SPC.log

For example: ``ethane.log`` and ``ethane_TZ.out``

.. code:: shell

    goodvibes ethane.log --spc TZ 

You will get the following output:

.. highlight:: none

.. literalinclude:: resources/jupyter_outputs.txt
    :start-after: ethane_spc-start
    :end-before: ethane_spc-end

.. highlight:: default

Potential Energy Surface Calculations:
--------------------------------------

GoodVibes can compute relative energy/thermochemistry values to describe a reaction pathway with a potential energy surface

To do this, we need to write a yaml file with 3 sections:

* PES
    * Defines reaction pathway
    * Can add multiple pathways 
* SPECIES 
    * Relates files to each species in the reaction pathway  
* FORMAT 
    * Optional additional formatting 

.. highlight:: python

.. literalinclude:: resources/PhPy.yaml

.. highlight:: default

Putting it All Together
-----------------------

* Temperature adjustments
* Single Point Calculations
* Potential Energy Surface Calculations

We can use these 24 intermediate and transition state calculations + corresponding SPC files + yaml to define a reaction pathway

.. code:: none

    goodvibes *.log -t 353.15 --spc DLPNO --imag --invertifreq -5 --pes PhPy.yaml

You will get the following as output:

.. highlight:: none

.. literalinclude:: resources/jupyter_outputs.txt
    :start-after: pes_numbers-start
    :end-before: pes_numbers-end

.. highlight:: default

Graphing these potential energy surfaces is simple once the yaml file is created

.. code:: none

    goodvibes *.log -t 353.15 --spc DLPNO --imag --invertifreq -5 --pes PhPy.yaml --graph PhPy.yaml

.. centered:: |PhPy-PES|

You can add more or less details by changing the FORMAT section of the yaml file. This is where you might tell GoodVibes you do not want to plot the different conformations of each structure, only the energies.

Running on Multiple Processors
------------------------------

GoodVibes allows you to run in multiple processors, reducing the wall time required for extracting the data.
This can be done with the ``--jobs`` flag: 

.. code:: none

    goodvibes *.log --jobs 16

This will use 16 processors to run GoodVibes on all your Gaussian output files.

Saving Metadata
----------------

Another feature of GoodVibes is that it will save the metadata from a run in a JSON file. 
This will allow users to add single point energy corrections, temperature corrections, concentration corrections, etc.
without needing to fully parse the data again. This is specified with the ``--json`` flag:

.. code:: none

    goodvibes *.log --json goodvibes_thermo_data.json

The JSON file contains the metadata for the run and can be called back in future runs with:

.. code:: none

    goodvibes --import goodvibes_thermo_data.json -t 310



Check out other packages by the Paton lab @ our `GitHub <https://github.com/patonlab>`_!