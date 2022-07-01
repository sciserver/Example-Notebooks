<h1>Getting started: Astronomy</h1>

This folder contains examples of Python notebooks for use in astronomy. 

It contains several folders:

<ul>
	<li><strong><code>Astronomy Image in Compute</code></strong> contains details about the packages that the <code>Astronomy</code> image in SciServer-Compute contains in order to support several use cases, as well as Jupyter Notebooks that can be run together with it. To run the notebooks, you must be use a container running the <code>Astronomy</code> compute image.</li>
	<li><strong><code>sdss_mosaics</code></strong> contains an example of how to generate an image mosaic around a specified object or area of sky by downloading SDSS FITS images and assembling them using the <a href="http://montage.ipac.caltech.edu/">Montage</a> online image processing toolkit. To run the example notebook, you must be use a container running the <code>Montage</code> compute image.</li>
	<li><strong><code>teaching</code></strong> contains several examples of notebooks you can use an adapt to create interactive hands-on activities that bring real scientific data to astronomy courses. Examples range from a 5-10 minute activities for use in a large lecture setting to a full curriculum for an upper-level graduate course. These examples should work in any compute image, including the default <code>SciServer Essentials 2.0</code> image.</li> 
</ul>

Remember that you can run these scripts here, and make changes to them, but you cannot save your changes in this read-only Data Volume. To save your changes, copy these scripts into your <strong><code>persistent</code></strong> folder, either using the <em>Files</em> tab of your dashboard or with a Terminal command.

If you have any questions, please email us at sciserver-helpdesk@jhu.edu.