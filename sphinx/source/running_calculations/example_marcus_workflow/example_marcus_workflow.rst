.. |scheme1| image:: images_marcus/scheme1.png
.. |delta_G| image:: images_marcus/delta_G.png
.. |lambda_scheme| image:: images_marcus/lambda_scheme.png   
.. |scheme2| image:: images_marcus/scheme2.png



==================================================================
Calculating Electron-Transfer Barriers
==================================================================

1. Introduction
---------------

Here we describe the workflow for computing thermal activation barriers
for outer-sphere electron transfer (ET) processes using the Marcus–Hush model.
The procedure outlines how to obtain the free energy difference (:math:`\Delta G ^\circ`)
and reorganization energy (:math:`\lambda`) from density functional theory (DFT) calculations,
including the use of non-equilibrium solvation to calculate the solvent contributions.

2. Terminologies and Definitions
--------------------------------

:math:`\boldsymbol{\Delta G ^\circ}` **(Free Energy Difference):**
Gibbs free energy difference between reactant (pre-SET) and product (post-SET) states.

:math:`\boldsymbol{\lambda}` **(Reorganization Energy):**  
Sum of the energetic penalties associated with reorganizing. There are 
two types of reorganization energy:

- :math:`\lambda_i` : Internal geometry change  
- :math:`\lambda_{\circ}` : Solvent/environmental response

**Activation Barrier (Marcus)**  

:math:`\Delta G ^ \ddagger\ = \frac{(\lambda + \Delta G ^ \circ )^ 2}{4\lambda}`

**Non-Equilibrium Solvation**  
A solvation model in which the solvent polarization from one electronic state is
used to evaluate the energy of another state (using ``NonEq=Save`` / ``NonEq=Read``).

3. Brief Theory
---------------

Consider the example electron transfer (ET) between a triplet quinone
derivative (acceptor) and benzene (donor).

.. centered:: |scheme1| 

The :math:`\Delta G ^\circ` (free energy difference) between the reactant (before ET)
and product (after ET) states is the Gibbs free energy difference
between the optimized "bottom of the well" geometries of the structures.

.. centered:: |delta_G| 

The reorganization energy (:math:`\lambda`) can be visualized as the energy penalty to
take the reactant structures from their optimal geometry and solvation
shell to the geometry and solvation shell of the product, while maintaining
their initial electronic configuration.

.. centered:: |lambda_scheme| 

4. Procedure
------------

The Marcus–Hush calculation consists of three major steps:

1. Compute :math:`\Delta G ^\circ` from optimized reactant and product states.
2. Compute :math:`\lambda` using four single-point calculations (Nelsen's four-point method).
3. Calculate :math:`\Delta G ^\ddagger` using the Marcus equation.

Step 1: Compute Free Energy Difference (:math:`\Delta G ^\circ`)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Optimize the geometries of the reactant and product states separately.
- Extract the Gibbs free energies from each calculation.
- Compute:

:math:`\Delta G ^ \circ\ = G_{product} - G_{reactant}`

Step 2: Compute Reorganization Energy (:math:`\lambda`)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reorganization energy is calculated using four single-point calculations:
two on reactant surfaces and two on product surfaces under non-equilibrium solvation.

Required Calculations
^^^^^^^^^^^^^^^^^^^^^

A. **Reactant-State Energies**

- :math:`\boldsymbol{E_1}` : Donor (D) at its own optimized geometry and solvation  
  Charge/spin = reactant state  
  Save solvation environment using ``NonEq=Save``

- :math:`\boldsymbol{E_2}` : Acceptor (A) at its own optimized geometry and solvation  
  Charge/spin = reactant state  
  Save solvation environment using ``NonEq=Save``

B. **Product-State Energies Using Reactant Electronic Configuration**

- :math:`\boldsymbol{E_3}` : Donor (D) at the product-optimized geometry  
  Use reactant charge/multiplicity  
  Read product solvation environment with ``NonEq=Read``

- :math:`\boldsymbol{E_4}` : Acceptor (A) at the product-optimized geometry  
  Use reactant charge/multiplicity  
  Read product solvation environment with ``NonEq=Read``

Computing :math:`\lambda`
^^^^^^^^^^^^^^^^^^^^^^^^^

:math:`\lambda = (\boldsymbol{E_3} - \boldsymbol{E_1}) + (\boldsymbol{E_4} - \boldsymbol{E_2})`

Forward and Reverse :math:`\lambda`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compute :math:`\lambda` on both reactant and product surfaces.

If the values differ (which is common), take the geometric mean
following Nelsen’s recommendation:

:math:`\lambda_{eff} = \sqrt{\lambda_{forward} \times \lambda_{reverse}}`

Step 3: Calculate Activation Barrier (:math:`\Delta G ^ \ddagger`)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the standard Marcus equation:

:math:`\Delta G ^ \ddagger\ = \frac{(\lambda + \Delta G ^ \circ )^ 2}{4\lambda}`

This value is used as the ET activation barrier.

5. Example Workflow for :math:`\lambda` Calculation
---------------------------------------------------

We demonstrate the :math:`\lambda` calculation workflow using the example shown above.

.. centered:: |scheme2|

Four energies are required:

* :math:`\boldsymbol{E_1}`: Optimized D, charge 0, multiplicity 1
* :math:`\boldsymbol{E_2}`: Optimized 3A, charge 0, multiplicity 3
* :math:`\boldsymbol{E_3}`: Cation D⁺ geometry, but electronic configuration of D (charge 0, multiplicity 1); ``NonEq=Read`` (from saved solvation from D⁺)
* :math:`\boldsymbol{E_4}`: Anion A⁻ geometry, but electronic configuration of 3A (charge 0, multiplicity 3); ``NonEq=Read`` (from saved solvation from A⁻)

Compute :math:`\lambda` via:

:math:`\lambda = (\boldsymbol{E_3} - \boldsymbol{E_1}) + (\boldsymbol{E_4} - \boldsymbol{E_2})`

Repeat for product-state ET and take the geometric mean.



