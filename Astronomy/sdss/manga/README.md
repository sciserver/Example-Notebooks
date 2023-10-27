<h1>SDSS MaNGA data on SciServer</h1>

[MaNGA](https://www.sdss.org/surveys/manga/) is a program from the Sloan Digital Sky Survey and stands for Mapping Nearby Galaxies at APO (Apache Point Observatory).  The MaNGA survey is a wide-field IFU survey of nearby galaxies, producing integral field spectroscopic observations of ~10,000 galaxies, with a goal to map the detailed composition and kinematic structure by measuring spectra for hundreds of points within each galaxy.     

[Marvin](https://www.sdss.org/dr17/manga/marvin/) is a software suite for easily accessing, exploring, and visualizing the MaNGA dataset, with complete documentation located at https://sdss-marvin.readthedocs.io/en/latest/.  This software package is available on SciServer with access to the public SDSS DR15 MaNGA dataset.  To get started using Marvin and the MaNGA data, do the following:

<ol>
    <li>Go to the Home tab on your SciServer Dashboard</li>
    <li>Click on Compute from the list of SciServer Apps to open SciServer Compute</li>
    <li>Click the <strong>Create container</strong> button to open the options for starting a virtual computing environment</li>
    <li>Give your new container a name, choose the <strong>Marvin</strong> compute image, and be sure to check the relevant Data Volumes: <strong>Getting Started</strong>, <strong>SDSS SAS</strong></li>
    <li>Click Create; your new container will appear in the list</li>
    <li>Click on the name of the container to launch</li>
</ol>

The SDSS SAS Data Volume provides access to the SDSS DR17 MaNGA data.  To learn more about the volume, go [here](https://www.sciserver.org/datasets/) and select the "SDSS Science Archive Server (SDSS SAS)" dropdown from "Public Data Volumnes".  To learn more about the Marvin compute image, go [here](https://www.sciserver.org/compute-images/#manga).  

Once you have launched your new container, go to <strong><code>getting_started/Astronomy/SDSS - MaNGA/</code></strong> to access the example notebooks.
<ul>
    <li><strong>Basics_of_Marvin</strong>: a basic introduction into the Marvin software and how to access MaNGA data products</li>
    <li><strong>lean_tutorial</strong>: a "lean" tutorial highlighting how to access MaNGA data analysis maps, plot BPT diagrams, and select and plot galaxy subset regions, e.g. star-forming spaxels</li>
    <li><strong>marvin_whan</strong>: an example science use case of creating and plotting a custom WHAN diagram, i.e. a "Width of Halpha versus NII" diagram, for any particular galaxy of interest.</li>
    <li><strong>marvin_queries</strong>: a guide to querying the MaNGA dataset using the Marvin Query system. Learn how to construct simply queries on parameters from the DRPall and DAPall MaNGA summary files, parameters from the NASA-Sloan Atlas catalog (NSA), or on MaNGA targeting flags.</li>
    <li><strong>Marvin_Results</strong>: a guide on handling query results via the Marvin Results.  Learn how to page through a set of results, quickly create scatter plots and histograms, and convert results to other formats, e.g. Pandas Dataframes or Marvin Tool objects. </li>
</ul>

Copy these to your <strong><code>persistent</code></strong> directory under <strong><code>Storage</code></strong> and have at it!

If you have any questions, please email sciserver-helpdesk@jhu.edu.

Have fun!