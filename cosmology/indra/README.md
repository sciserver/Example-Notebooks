<h1>Indra Simulations on SciServer</h1>

Indra is a suite of large-volume cosmological N-body simulations hosted on SciServer. To get started using the Indra Simulations, do the following:

<ol>
    <li>Go to the Science Domains tab on your SciServer Dashboard</li>
    <li>Click the Cosmological Simulations domain on the left, then click Join </li>
    <li>Go to the Home tab on your SciServer Dashboard</li>
    <li>Click on Compute from the list of SciServer Apps to open SciServer Compute</li>
    <li>Click the <strong>Create container</strong> button to open the options for starting a virtual computing environment</li>
    <li>Give your new container a name, choose the <strong>Cosmological Simulations</strong> compute image, and be sure to check the relevant Data Volumes: <strong>Getting Started</strong>, <strong>Indra Simulations</strong>, <strong>Indra (FileDB)</strong>, and <strong>Indra (Datascope)</strong></li>
    <li>Click Create; your new container will appear in the list</li>
    <li>Click on the name of the container to launch</li>
</ol>

Once you have launched your new container, go to <strong><code>getting_started/AAS2021/CosmologicalSimulations/Indra</code></strong> to access the example notebooks. These are also located in the main <strong><code>indra</code></strong> data volume and in the [indra-tools](https://github.com/bfalck/indra-tools) github repo.
<ul>
    <li><strong>read_examples</strong>: How to read all of the data products: snapshots of particle positions and velocities, plus pre-computed power spectra at select snapshots; Fourier modes of the coarse-gridded density field; and the halo and subhalo catalogs, including how to index the halo catalogs and retrieve IDs of particles in halos.</li>
    <li><strong>database_examples</strong>: How to query the halo database tables, including sample queries that demonstrate how to select from one run and snapshot, one run and multiple snapshots, and one snapshot and multiple runs.</li>
    <li><strong>density_field_examples</strong>: How to compute real-space density fields from the Fourier-space density fields and from the snapshots of particle positions, as well as how to create quick slices for plots using the Shape3D functionality.</li>
    <li><strong>Shape3D_examples</strong>: How to use Shape3D objects to efficiently read subsets of particles contained in spheres, boxes, cones, and cone segments to e.g. grab all particles around (or in) a given halo or create lightcones.</li>
</ul>

Copy these to your <strong><code>persistent</code></strong> directory under <strong><code>Storage</code></strong> and have at it!


If you have any questions, please email sciserver-helpdesk@jhu.edu.

Have fun!