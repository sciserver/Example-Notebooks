<h1>Millennium Simulations on SciServer</h1>
SciServer contains a mirror of the Millennium Database hosted by the MPA in Germany at http://gavo.mpa-garching.mpg.de/Millennium.
These databases can be accessed through the CasJobs tool that has been used to disseminate catalogues from
the Sloan Digital Sky Survey.

SciServer also host raw simulation files containing the particles of these N-Body simulations. 
Notebooks showing how to access these can be found in the demo folders.

A set of slides describing the backgroupnd of thiis "FileDB" approach can be found in the FileDB.pdf file below.

To get started using the Millennium Simulations, do the following:

<ol>
    <li>Go to the Science Domains tab on your SciServer Dashboard</li>
    <li>Click the Cosmological Simulations domain on the left, then click Join </li>
    <li>Go to the Home tab on your SciServer Dashboard</li>
    <li>Click on Compute from the list of SciServer Apps to open SciServer Compute</li>
    <li>Click the <strong>Create container</strong> button to open the options for starting a virtual computing environment</li>
    <li>Give your new container a name, choose the <strong>Cosmological Simulations</strong> compute image, and be sure to check the relevant Data Volumes: <strong>Getting Started</strong>, <strong>Virgo</strong>, <strong>Virgo (FileDB)</strong>, and <strong>Indra (Datascope)</strong></li>
    <li>Click Create; your new container will appear in the list</li>
    <li>Click on the name of the container to launch</li>
</ol>

Once you have launched your new container, go to <strong><code>getting_started/AAS2021/CosmologicalSimulations/Virgo</code></strong> to access the example notebooks. There are 4 folders that collect notebooks with a common theme.
<ul>
    <li><strong>Demo1_MillenniumDatabase</strong> illustrates how to execute the <a href="http://gavo.mpa-garching.mpg.de/Millennium/Help/demo/genericqueries" target="_blank">demo queries</a> from the Millennium Database.
        It shows how to use the SciServer.CasJobs python library to define the queries, execute them and visualize their results in a single Jupyter notebook</li>
    <li><strong>Demo2_FileDB_ParticleAccess</strong>: Shows how to retrieve particles in spheres around the most massive halos in the database, but now not using SQL, but with python code accessing the files directly.</li>
    <li><strong>Demo3_HaloDensityProfiles</strong>: Shows how to use the database to link dark matter halos to the particles they are mad off. Calculates density profiles from the particles
There also for a sample of halos stratified by mass determine their density profile from the particles queried using our "FileDB" approach. Fit these halos to the Hernquist and NFW profiles and plot the relation between mass and scaling radius.</li>
</ul>

To run and save these notebooks you best copy these to your <strong><code>persistent</code></strong> directory under <strong><code>Storage</code></strong>. There is one parameters, the root_folder, that you should change to use your username rather than and have at it!


If you have any questions, please email sciserver-helpdesk@jhu.edu.

Enjoy!