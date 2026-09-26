=============================================
A Standard Workflow for Reaction Mechanisms
=============================================

.. contents::
    :local:

This page gives an overview of how a typical computational study of an organic
reaction fits together, from building structures to reporting free energies. Each
step links to a more detailed page on this wiki where one exists.

The methods named below are **reasonable starting points, not fixed rules**. The
right level of theory depends on the chemistry (e.g. transition metals, open-shell
species, anions, non-covalent interactions), so always discuss the choice with
your mentor, and check what previous group papers on similar systems used.

.. tip::

    A useful sense of scale: at 298 K, a free energy difference of 1.36 kcal/mol
    corresponds to a factor of 10 in rate or equilibrium constant. Many selectivity
    questions come down to 1–2 kcal/mol, which is comparable to the typical error of
    a DFT method. Think about what accuracy your question actually needs.

Overview
--------

#. Build starting structures for every species (reactants, intermediates,
   transition states, products).
#. Search for conformers of each species.
#. Optimize the low-energy conformers with DFT and compute frequencies.
#. Check each stationary point (minima vs transition states; IRC for TSs).
#. Compute more accurate single-point energies at a higher level of theory.
#. Compute free energies with appropriate corrections and Boltzmann-weight conformers.
#. Report everything needed to reproduce the results.

1. Building Structures
----------------------

Build structures in GaussView, Avogadro, or from SMILES with RDKit
(:doc:`../running_calculations/example_descriptors_workflow/example_descriptors_workflow`).
Double-check charge, multiplicity, and stereochemistry: most "strange" results
traced back later start here.

2. Conformer Searching
----------------------

The lowest-energy conformer is rarely the one you drew. Search conformers for
**every** species, including transition states, because a missed conformer can
shift a barrier by several kcal/mol.

*  Minima: CREST with GFN2-xTB and an implicit solvent (``--alpb``), or RDKit/AQME
   (:doc:`../running_calculations/example_aqme_workflow/example_aqme_workflow`).
*  Transition states: constrain the forming/breaking bonds during the search
   (:doc:`../running_calculations/example_qcalibrate_ts_conf_search/example_qcalibrate_ts_conf_search`).
*  Large ensembles can be pre-screened with cheap DFT single points before full
   optimizations (e.g. CENSO:
   :doc:`../running_calculations/example_censo_workflow/example_censo_workflow`).

3. Geometry Optimization and Frequencies
----------------------------------------

Optimize the lowest conformers (typically those within a few kcal/mol of the minimum)
and compute harmonic frequencies at the same level of theory.

*  Use a functional **with a dispersion correction** (e.g. B3LYP-D3(BJ), ωB97X-D,
   M06-2X) or a composite method such as r²SCAN-3c. Plain B3LYP without dispersion
   is not recommended for organic chemistry.
*  A double-ζ basis set (e.g. def2-SVP or 6-31G(d)) is usually adequate for geometries;
   add diffuse functions for anions.
*  Include implicit solvation (e.g. SMD or CPCM) when the reaction happens in solution,
   especially if charges are separating or forming.

4. Checking Stationary Points
-----------------------------

*  **Minima** must have no imaginary frequencies. A small imaginary frequency
   (under about 50 cm\ :sup:`-1`) usually means the optimization is not fully converged
   or the integration grid is too coarse. Displace along the mode and re-optimize
   instead of ignoring it.
*  **Transition states** must have exactly one imaginary frequency. Animate it (e.g. in
   GaussView) to confirm it corresponds to the bond changes you expect.
*  Run an **IRC** calculation (or displace along the mode and optimize in both directions)
   to confirm the TS connects the intended reactant and product.

Common ways to locate a TS in Gaussian:

*  A relaxed scan along the forming bond, then ``opt=(ts,calcfc,noeigentest)`` starting
   from the highest point.
*  ``opt=(qst2)`` or ``opt=(qst3)`` from reactant and product (and TS guess) structures.
*  Re-optimizing a TS found for a related substrate after changing the substituents.

5. Single-Point Energies
------------------------

Electronic energies are more sensitive to the level of theory than geometries, so it is
common to compute single points on the optimized geometries with a larger basis set
(triple-ζ, e.g. def2-TZVP) and/or a more accurate method (e.g. a hybrid or double-hybrid
functional, or DLPNO-CCSD(T) for benchmarking). Use the same solvation model as the
optimization. GoodVibes combines single points with thermal corrections through its
``--spc`` option.

.. warning::

    Never compare energies obtained at different levels of theory, with different
    solvent models, or with different integration grids. Every species in a reaction
    profile must be computed the same way.

6. Free Energies
----------------

Use GoodVibes
(:doc:`../running_calculations/example_goodvibes_workflow/example_goodvibes_workflow`) to:

*  apply a quasi-harmonic correction for low-frequency modes,
*  correct to the 1 mol/L standard state for solution-phase reactions (``-c 1``),
*  use the experimental temperature (``--temp``),
*  Boltzmann-weight conformer ensembles and build the reaction profile (``--pes``).

7. Reporting and Reproducibility
--------------------------------

Your SI should allow someone else to reproduce every number. Include:

*  The full level of theory for optimizations and single points (functional, dispersion,
   basis set, solvation model and solvent), the software and version, and the citations.
*  The thermochemistry settings (temperature, standard state, quasi-harmonic method and cutoff).
*  Cartesian coordinates of every structure, with its energies.
*  Imaginary frequencies of every transition state.

Keep the input and output files for every reported structure, and archive them on
RStor at the end of the project.

Common Gaussian Problems
------------------------

.. list-table::
    :header-rows: 1
    :widths: 35 65

    * - Symptom
      - Things to try
    * - Optimization did not converge (error in l9999)
      - Restart from the last geometry (``geom=check guess=read``). Use ``calcfc`` so the
        optimization starts from an accurate Hessian, or reduce the step size (``opt=(maxstep=10)``).
    * - SCF did not converge (error in l502)
      - Start from a converged guess (``guess=read``), check charge and multiplicity,
        or use ``scf=xqc``.
    * - ``FormBX had a problem`` (l103)
      - Linear or near-linear angles broke the internal coordinates; try ``opt=cartesian``.
    * - ``Erroneous write`` / job killed without an error
      - Scratch disk or memory exhausted. Check disk space and keep Gaussian's ``%mem`` a
        little below the memory requested from Slurm.
    * - A minimum has a small imaginary frequency
      - Tighten convergence (``opt=tight``) or displace along the mode and re-optimize.

Suggested Reading
-----------------

*  M. Bursch, J.-M. Mewes, A. Hansen, S. Grimme, "Best-Practice DFT Protocols for Basic
   Molecular Computational Chemistry", *Angew. Chem. Int. Ed.* **2022**, *61*, e202205735.
   `doi:10.1002/anie.202205735 <https://doi.org/10.1002/anie.202205735>`__
*  P. Pracht, F. Bohle, S. Grimme, "Automated exploration of the low-energy chemical space
   with fast quantum chemical methods", *Phys. Chem. Chem. Phys.* **2020**, *22*, 7169.
   `doi:10.1039/C9CP06869D <https://doi.org/10.1039/C9CP06869D>`__
*  G. Luchini, J. V. Alegre-Requena, I. Funes-Ardoiz, R. S. Paton, "GoodVibes: automated
   thermochemistry for heterogeneous computational chemistry data", *F1000Research*
   **2020**, *9*, 291. `doi:10.12688/f1000research.22758.1 <https://doi.org/10.12688/f1000research.22758.1>`__
*  L. Goerigk et al., "A look at the density functional theory zoo with the advanced GMTKN55
   database for general main group thermochemistry, kinetics and noncovalent interactions",
   *Phys. Chem. Chem. Phys.* **2017**, *19*, 32184.
   `doi:10.1039/C7CP04913G <https://doi.org/10.1039/C7CP04913G>`__
