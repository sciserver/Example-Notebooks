<h1>HEASARC</h1>

SciServer hosts a copy of all of the public data hosted at the HEASARC (https://heasarc.gsfc.nasa.gov/) as part of the `HESARC` data volume, as well as the `HEASARCv6.28` docker image with a full copy of the HEASoft software package v6.28 as described at https://heasarc.gsfc.nasa.gov/docs/software/heasoft/ .

<h3>Demo</h3>
This directory contains demo notebooks and related materials. 
To start using these notebooks, first follow the instructions at https://heasarc.gsfc.nasa.gov/docs/sciserver/ to setup your container (`getting started` section):
<ol>
    <li>Go to https://apps.sciserver.org/compute/ </li>
    <li>Click the <strong>Create container</strong> button to open the options for starting a virtual computing environment</li>
    <li>Give your new container a name, choose the <strong>HEASARCv6.28</strong> compute image, and be sure to check the relevant Data Volumes: <strong>Getting Started</strong>, <strong>HEASARC data</strong></li>
    <li>Click Create; your new container will appear in the list</li>
    <li>Click on the name of the container to launch</li>
</ol>


Once the container is created, copy this folder to your persistent storage: `cp -r /home/idies/workspace/getting_started/AAS2021/HEASARC/ /home/idies/workspace/Storage/<my--user--name>/persistent/` , replacing `<my--user--name>` with your SciServer user name.
Once the folder is copied, you can run the notebooks iit contains in your own workspace.

 For more detail about the software environment, please read the next sections under https://heasarc.gsfc.nasa.gov/docs/sciserver/ .
