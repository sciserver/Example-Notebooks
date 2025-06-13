# Indra Cosmological Simulations
Indra is a suite of large-volume cosmological *N*-body simulations. Each of the 384 simulations is computed with the same WMAP7 cosmological parameters and different initial phases, providing excellent statistics of the large-scale features of the distribution of dark matter in the universe. The independent volumes each have 1024<sup>3</sup> dark matter particles in a box of length 1 Gpc/*h*.

The Indra data volumes contain, for each simulation:
- 64 snapshots of particle positions and velocities
- 64 snapshots of FOF and SUBFIND halo catalogs
- 505 time-steps of coarse-gridded Fourier-space density fields

The Indra relational database contains:
- Halo catalog tables for every simulation and snapshot
- Spatial3D library to allow efficient selection of halos and particle data within 3-dimensional shapes


To access Indra, create an account on [SciServer](http://www.sciserver.org) and join the *Cosmological Simulations* Science Domain. Information about using SciServer, including how to [join the Science Domain](https://www.sciserver.org/integration/), is available on the [help](https://www.sciserver.org/support/) pages.

Then, from the SciServer *Dashboard*, navigate to *Compute* and create a container: select the *Cosmological Simulations* compute image and mount all three Indra *Data Volumes*. The *Cosmological Simulations* compute image comes with the [indra-tools](https://github.com/bfalck/indra-tools) library pre-installed plus all software on the default *SciServer Essentials* image. 

To install indra-tools by hand, go to a terminal in a SciServer container (that has the Indra data volumes mounted) and execute:

`pip install git+https://github.com/bfalck/indra-tools.git`

We ask that scientific publications that make use of Indra cite the Falck, et al. [data release paper](https://arxiv.org/abs/2101.03631) (submitted to MNRAS).


-----
## Contents of this Indra directory

### Example notebooks
Example notebooks are provided that demonstrate how to:
- use the reading functions: `read_examples.ipynb` (**Start here**)
- query the halo catalog database tables: `database_examples.ipynb`
- compute density fields: `density_field_examples.ipynb`
- selectively (and efficiently) read particles in 3-dimensional shapes such as a sphere, box, or cone: `Shape3D_examples.ipynb`

Copy them to your *persistent* home directory to use and edit. 

### `2_0_0_NoCM_1024p` and `2_0_0_NoCM_bug`

These folders contain FFT and power spectra output from the `2_0_0` test simulations.


### corrfunc

Correlation functions calculated from CIC grids with 1024^3 cells, for most Indra runs and redshifts 0 and 1. Saved as text files with columns giving r, xi, and number of modes.


### data
Meta-data files copied from the indra-tools git repository: particle and halo snapshot info, FFT snapshot info, and the CAMB initial power spectrum.


### database

files.csv to facilitate loading of PHBins tables to database for Shape3D functionality.


### origami

Cosmic web identifier [ORIGAMI](https://github.com/bfalck/origami) tag files for a few Indra volumes and many redshifts.


### pk

Power spectra calculated from CIC grids with 512^3 cells, for 320 Indra volumes (`2_0_0` to `6_7_7`) and several redshifts. Saved as numpy arrays, and can be read with the indra-tools function `cic_pk()`.

